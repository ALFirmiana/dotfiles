local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { gh 'karb94/neoscroll.nvim' }

local neoscroll = require 'neoscroll'

neoscroll.setup {
  easing = 'quadratic',
}
vim.keymap.set({ 'n', 'v' }, 'J', function() neoscroll.scroll(5, { move_cursor = true, duration = 80, easing = 'linear' }) end)

vim.keymap.set({ 'n', 'v' }, 'K', function() neoscroll.scroll(-5, { move_cursor = true, duration = 80, easing = 'linear' }) end)

-- vim: ts=2 sts=2 sw=2 et
