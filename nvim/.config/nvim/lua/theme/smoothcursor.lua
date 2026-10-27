local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { gh 'gen740/SmoothCursor.nvim' }
require('smoothcursor').setup {
  type = 'matrix',
  matrix = {
    unstop = true,
  },
}

-- vim: ts=2 sts=2 sw=2 et
