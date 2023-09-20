-- https://github.com/mfussenegger/nvim-dap/wiki/C-C---Rust-(via--codelldb)
local M = {}
M.selected_config = "-"
M.dap_json = {}
local project_dir = vim.fn.getcwd()
local vscode_launch_json_path = project_dir .. '/.vscode/launch.json'
local dap_json_path = project_dir .. '/.nvim/dap.json'

local function removeComments(json)
  local lines = vim.split(json, '\n')
  local filtered_lines = {}
  for _, line in ipairs(lines) do
    -- 忽略以 // 开头的行
    if not line:match('^%s*//') then
      table.insert(filtered_lines, line)
    end
  end
  return table.concat(filtered_lines, '\n')
end

function M.load_dap_json()
  local json_file = io.open(dap_json_path, 'r')
  if json_file then
    local json_content = removeComments(json_file:read('*all'))
    json_file:close()
    M.dap_json = vim.fn.json_decode(json_content)
    if M.dap_json.current_config then
      M.selected_config = M.dap_json.current_config
    end
  end
end

function M.write_dap_json(name, value)
  local json_file = io.open(dap_json_path, 'w')
  if json_file then
    M.dap_json[name] = value
    json_file:write(vim.fn.json_encode(M.dap_json))
    json_file:close()
  end
end
function replace_vars(command)
  command = string.gsub(command, "${workspaceFolder}", project_dir)
  return command
end

function M.read_config()
  local launch_json_file = io.open(vscode_launch_json_path, 'r')
  if launch_json_file then
    local launch_json_content = removeComments(launch_json_file:read('*all'))
    launch_json_file:close()
    local launch_json_data = vim.fn.json_decode(launch_json_content)
    if launch_json_data.configurations then
      M.launchConfigMap = {}
      M.keys = {}
      -- 遍历每个配置
      for _, config in ipairs(launch_json_data.configurations) do
        if config.name and config.program and config.args then
          M.launchConfigMap[config.name] = {
            command = replace_vars(config.program),
            args = config.args
          }
          table.insert(M.keys, config.name)
        end
      end
    end
  else
    print('launch.json file not found.')
  end
end

function M.select_key()
  local selected_key = vim.api.nvim_call_function('confirm',
    { 'Select a launch configuration:', table.concat(M.keys, "\n"), 1 })
  if selected_key > 0 then
    if M.selected_config then
      M.selected_config = M.keys[selected_key]
      M.write_dap_json("current_config", M.selected_config)
    else
      print('invalid')
    end
  else
    print('No selection')
  end
end

function M.choose_config()
  M.read_config()
  M.select_key()
end

function M.on_dap_config(dap)
  local port = "13103"
  dap.adapters.codelldb = {
    type = 'server',
    port = port,
    executable = {
      command = 'codelldb',
      args = { "--port", port },
      -- On windows you may have to uncomment this:
      -- detached = false,
    }
  }

  dap.configurations.cpp = {
    {
      name = "Launch file",
      type = "codelldb",
      request = "launch",
      program = function()
        if M.selected_config then
          return M.launchConfigMap[M.selected_config].command
        else
          M.choose_config()
          if M.selected_config then
            return M.launchConfigMap[M.selected_config].command
          else
            return "./a.out"
          end
        end
      end,
      args = function()
        if M.selected_config then
          return M.launchConfigMap[M.selected_config].args
        else
          M.choose_config()
          if M.selected_config then
            return M.launchConfigMap[M.selected_config].args
          else
            return {}
          end
        end
      end,
      cwd = '${workspaceFolder}',
      stopOnEntry = false,
    },
  }
  dap.configurations.c = dap.configurations.cpp
  dap.configurations.rust = dap.configurations.cpp

  require("mvim.dap.python").setup(dap)

  -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#python
end

function M.init()
  lvim.builtin.dap.on_config_done = M.on_dap_config
  M.load_dap_json()
  M.read_config()
end

return M
