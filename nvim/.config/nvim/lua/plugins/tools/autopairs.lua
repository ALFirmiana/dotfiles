local function gh(repo) return 'https://github.com/' .. repo end

-- autopairs
-- https://github.com/windwp/nvim-autopairs

vim.pack.add { gh 'windwp/nvim-autopairs' }
require('nvim-autopairs').setup {}

-- vim: ts=2 sts=2 sw=2 et
