-- https://github.com/mfussenegger/nvim-dap/wiki/C-C---Rust-(via--codelldb)

function on_dap_config(dap)
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
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
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

lvim.builtin.dap.on_config_done = on_dap_config
