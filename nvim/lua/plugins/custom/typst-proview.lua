return {
  {
    'chomosuke/typst-preview.nvim',
    ft = 'typst',
    config = function()
      require('typst-preview').setup {
        dependencies_bin = { ['tinymist'] = 'tinymist' },
      }
      vim.keymap.set('n', '<leader>ll', '<CMD>TypstPreview<CR>', { desc = 'TypstPreview' })
    end,
  },
}
