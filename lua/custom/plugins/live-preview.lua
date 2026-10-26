-- live-preview.nvim: preview Markdown / HTML / AsciiDoc / SVG in a browser with live updates
-- https://github.com/brianhuster/live-preview.nvim

vim.pack.add {
  { src = 'https://github.com/brianhuster/live-preview.nvim', version = vim.version.range '0.*' },
}

require('livepreview.config').set {
  port = 5500,
  browser = 'default',
  dynamic_root = false,
  sync_scroll = true,
  -- Uses telescope.nvim (already installed) when running `:LivePreview pick`
  picker = 'telescope',
}

vim.keymap.set('n', '<leader>jp', '<cmd>LivePreview start<cr>', { desc = '[P]review current file in browser' })
