local M = {}
local X = require("vstask.Predefined")
function M.dump_vars()
  local vars = {}
  for k, v in pairs(X) do
    vars[k] = v()
  end
  return vars
end

function M.view_vars()
  local options = M.dump_vars()
  vim.notify(vim.inspect(options))
end

return M
