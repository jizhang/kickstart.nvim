vim.api.nvim_create_user_command('BufOnly', function()
  local keep = vim.api.nvim_get_current_buf()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if buf ~= keep and vim.fn.buflisted(buf) == 1 then
      pcall(vim.api.nvim_buf_delete, buf, {})  -- refuses if modified
    end
  end
end, { desc = 'Close all other buffers, keeping only the current buffer' })
