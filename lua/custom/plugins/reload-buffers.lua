-- Reload every listed buffer from disk (`:bufdo e`), then jump back to the buffer
-- that was current when the mapping was pressed.
vim.keymap.set('n', '<leader>je', function()
  local bufnr = vim.api.nvim_get_current_buf()
  local ok, err = pcall(vim.cmd, 'bufdo e')
  -- `:bufdo` leaves the last buffer loaded; restore the original one
  if vim.api.nvim_buf_is_valid(bufnr) then
    vim.api.nvim_set_current_buf(bufnr)
  end
  if not ok then
    vim.notify('Reloading all buffers failed: ' .. tostring(err), vim.log.levels.ERROR)
  end
end, { desc = 'R[e]load all buffers from disk (bufdo e)' })
