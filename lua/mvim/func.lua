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
  local toggleterm = require('toggleterm.terminal')
  local terms = toggleterm.get_all()
  vim.notify(vim.inspect(terms))
end

function M.toggleterm_status()
  local toggleterm = require('toggleterm.terminal')
  local terms = toggleterm.get_all()

  local status = 'T>'
  for idx, term in ipairs(terms) do
    local name = term.name
    local is_open = term:is_open()
    status = status .. term.id .. '[' .. (is_open and '@' or 'X') .. ']'
    if idx ~= #terms then
      status = status .. " "
    end
  end

  return status
end

return M
