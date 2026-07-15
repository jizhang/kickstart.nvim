vim.keymap.set('n', '<leader>jc', function()
  local cur_line = vim.fn.line('.')
  local total = 0
  local ln = cur_line - 1
  while ln > 0 do
    local line = vim.fn.getline(ln)
    local num_str = line:match('%S+%s+(%S+)')
    local num = tonumber(num_str)
    if not num then break end
    total = total + num
    ln = ln - 1
  end

  vim.fn.setline(cur_line, vim.fn.getline(cur_line) .. total)
end, { desc = 'Calculate calories'})
