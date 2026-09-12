return {
  {
    'luk400/vim-jukit',
    keys = {
      {
        '<leader>os',
        ':call jukit#splits#output()<cr>',
        desc = 'Open ipython splits',
      },
      {
        '<leader>np',
        ':call jukit#convert#notebook_convert("jupyter-notebook")<cr>',
        desc = 'Convert .ipynb to .py',
      },
    },
    init = function()
      vim.g.jukit_mappings = 1
      vim.g.jukit_mappings_ext_enabled = 'py'
    end,
  },
}
