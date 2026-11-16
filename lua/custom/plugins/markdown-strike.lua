vim.keymap.set('x', '<leader>jd', function()
  local p1 = vim.fn.getpos('v')
  local p2 = vim.fn.getpos('.')

  local start_pos, end_pos
  if p1[2] < p2[2] or (p1[2] == p2[2] and p1[3] <= p2[3]) then
    start_pos, end_pos = p1, p2
  else
    start_pos, end_pos = p2, p1
  end

  local sr, sc = start_pos[2] - 1, start_pos[3] - 1
  local er, ec = end_pos[2] - 1, end_pos[3]

  local lines = vim.api.nvim_buf_get_text(0, sr, sc, er, ec, {})
  lines[1] = '~~' .. lines[1]
  lines[#lines] = lines[#lines] .. '~~'
  vim.api.nvim_buf_set_text(0, sr, sc, er, ec, lines)
end, { desc = 'Markdown: wrap selection in ~~strikethrough~~' })
