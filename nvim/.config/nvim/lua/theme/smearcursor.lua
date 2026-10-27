local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { gh 'sphamba/smear-cursor.nvim' }
require('smear_cursor').setup {}

-- vim: ts=2 sts=2 sw=2 et
