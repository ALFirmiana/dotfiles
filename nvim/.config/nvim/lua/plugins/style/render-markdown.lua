local function gh(repo) return 'https://github.com/' .. repo end

-- Highlight todo, notes, etc in comments
vim.pack.add {
  gh 'MeanderingProgrammer/render-markdown.nvim',
  gh 'nvim-treesitter/nvim-treesitter',
  gh 'nvim-mini/mini.nvim',
}
require('render-markdown').setup {
  -- code = {
  --   disable_background = true,
  --   highlight_border = false,
  -- },
  overrides = {
    buftype = {
      nofile = {
        code = {
          disable_background = true,
          highlight_border = false,
        },
      },
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
