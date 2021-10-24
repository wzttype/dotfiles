local M = {}

_G['autocmd_handlers'] = {}

function M.add_autocommand(obj)
  for i, v in ipairs(obj.events) do
    _G['autocmd_handlers'][obj.name .. i] = v.handler
  end
  vim.cmd('augroup ' .. obj.name)
  vim.cmd('autocmd! * ' .. obj.target)
  for i, v in ipairs(obj.events) do
    local trigger = v.trigger .. ' ' .. obj.target
    local handler = 'lua autocmd_handlers["' .. obj.name ..  i ..'"]()'
    vim.cmd('autocmd ' .. trigger .. ' ' .. handler)
  end
  vim.cmd('augroup end')
end

return M
