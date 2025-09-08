-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- -- -- -- -- -- -- -- -- -- -- --
  -- mini.nvim
  require 'plugins.mini',

  -- -- -- -- -- -- -- -- -- -- -- --
  -- theme and style
  require 'theme.colorscheme',

  require 'theme.smoothcursor',

  require 'theme.smearcursor',

  -- -- -- -- -- -- -- -- -- -- -- --
  -- texts style
  require 'plugins.gitsigns',

  require 'plugins.todo-comments',

  require 'plugins.render-markdown',
  -- -- -- -- -- -- -- -- -- -- -- --
  -- useful tools
  require 'plugins.tools.im',

  require 'plugins.tools.neo-tree',

  require 'plugins.tools.which-key',

  require 'plugins.tools.telescope',

  require 'plugins.tools.lastplace',

  require 'plugins.tools.autopairs',

  require 'plugins.tools.toggleterm',

  -- AI assistent
  require 'plugins.tools.codecompanion',

  -- -- -- -- -- -- -- -- -- -- -- --
  -- language tools
  -- lsp format cmp treesitter dbg lint
  require 'plugins.language.lspconfig',

  require 'plugins.language.conform',

  require 'plugins.language.blink-cmp',

  require 'plugins.language.treesitter',

  require 'plugins.language.debug',

  require 'plugins.language.lint',

  -- language plugins and custom
  -- latex and markdown
  require 'plugins/custom/vimtex',
  require 'plugins/custom/markdown-preview',
  require 'plugins/custom/typst-proview',

  -- ipython
  require 'plugins/custom/ipython',
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et
