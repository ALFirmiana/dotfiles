local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { gh 'karb94/neoscroll.nvim' }
require('neoscroll').setup {
  easing = 'quadratic',
}

-- vim: ts=2 sts=2 sw=2 et
