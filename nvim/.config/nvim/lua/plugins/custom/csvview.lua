local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { gh 'hat0uma/csvview.nvim' }

require('csvview').setup {
  parser = {
    delimiter = { ft = { tsv = '\t' } },
    comments = { '#', '//' },
  },
  view = {
    display_mode = 'border',
  },
  keymaps = {
    textobject_field_inner = { 'if', mode = { 'o', 'x' } },
    textobject_field_outer = { 'af', mode = { 'o', 'x' } },
    jump_next_field_end = { '<Tab>', mode = { 'n', 'v' } },
    jump_prev_field_end = { '<S-Tab>', mode = { 'n', 'v' } },
    jump_next_row = { '<Enter>', mode = { 'n', 'v' } },
    jump_prev_row = { '<S-Enter>', mode = { 'n', 'v' } },
  },
}
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('csvview_autostart', { clear = true }),
  pattern = { 'csv', 'tsv' },
  callback = function() require('csvview').enable(0) end,
  desc = 'Auto enable csvview',
})

-- vim: ts=2 sts=2 sw=2 et
