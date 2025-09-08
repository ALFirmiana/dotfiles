return {
  {
    'chomosuke/typst-preview.nvim',
    ft = 'typst',
    config = function()
      require('typst-preview').setup {
        open_cmd = 'zen --new-window %s',
        dependencies_bin = { ['tinymist'] = 'tinymist' },
      }
      vim.keymap.set('n', '<leader>ll', '<CMD>TypstPreview<CR>', { desc = 'TypstPreview' })
    end,
  },
}
