return {
  {
    'chomosuke/typst-preview.nvim',
    ft = 'typst',
    config = function()
      local open_cmd
      if vim.fn.has 'mac' == 1 then
        open_cmd = '/Applications/Zen.app/Contents/MacOS/zen --new-window %s'
      else
        open_cmd = 'zen-browser --new-window %s'
      end

      require('typst-preview').setup {
        open_cmd = open_cmd,
        dependencies_bin = { ['tinymist'] = 'tinymist' },
      }
      vim.keymap.set('n', '<leader>ll', '<CMD>TypstPreview<CR>', { desc = 'TypstPreview' })
    end,
  },
}
