-- -- -- -- -- -- -- -- -- -- -- --
-- theme and style
require 'theme.colorscheme'

require 'theme.smoothcursor'

require 'theme.smearcursor'

require 'theme.starter'

-- -- -- -- -- -- -- -- -- -- -- --
-- mini.nvim
-- contain several styles and tools
-- ai surround statusline tabline indentscope
require 'plugins.mini'

-- -- -- -- -- -- -- -- -- -- -- --
-- language tools
-- lsp format cmp treesitter dbg lint
require 'plugins.language.lspconfig'

require 'plugins.language.conform'

require 'plugins.language.blink-cmp'

require 'plugins.language.treesitter'

require 'plugins.language.debug'

require 'plugins.language.lint'

-- -- -- -- -- -- -- -- -- -- -- --
-- texts style
require 'plugins.style.gitsigns'

require 'plugins.style.todo-comments'

require 'plugins.style.render-markdown'

-- -- -- -- -- -- -- -- -- -- -- --
-- useful tools
require 'plugins.tools.im'

require 'plugins.tools.neo-tree'

require 'plugins.tools.which-key'

require 'plugins.tools.telescope'

require 'plugins.tools.lastplace'

require 'plugins.tools.autopairs'

-- -- -- -- -- -- -- -- -- -- -- --
-- ai assistant
require 'plugins.ai.codecompanion'

require 'plugins.ai.minuet-ai'

-- -- -- -- -- -- -- -- -- -- -- --
-- language plugins and custom
require 'plugins.custom.csvview'

-- vim: ts=2 sts=2 sw=2 et
