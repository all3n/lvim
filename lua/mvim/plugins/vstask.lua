local M = {}
M.label = ''
function M.init()
  require("vstask").setup({
    cache_json_conf = true,  -- don't read the json conf every time a task is ran
    cache_strategy = "last", -- can be "most" or "last" (most used / last used)
    config_dir = ".vscode",  -- directory to look for tasks.json and launch.json
    use_harpoon = false,     -- use harpoon to auto cache terminals
    telescope_keys = {       -- change the telescope bindings used to launch tasks
      vertical = '<C-v>',
      split = '<C-p>',
      tab = '<C-t>',
      current = '<CR>',
    },
    autodetect = { -- auto load scripts
      npm = "on"
    },
    terminal = 'toggleterm',
    term_opts = {
      vertical = {
        direction = "vertical",
        size = "8"
      },
      horizontal = {
        direction = "horizontal",
        size = "8"
      },
      current = {
        direction = "horizontal",
        size = "8"
      },
      tab = {
        direction = 'tab',
      }
    }
  })
end

function M.run_last()
  local vstask_ok, vstask = pcall(require, "vstask")
  if not vstask_ok then
    return
  end
  local opts = vstask.get_last()
  if opts then
    vstask.run_last(opts)
  end
end

function M.status()
  local vstask_ok, vstask = pcall(require, "vstask")
  if not vstask_ok then
    return
  end
  local opts = vstask.get_last()
  return opts['label']
end

return M
