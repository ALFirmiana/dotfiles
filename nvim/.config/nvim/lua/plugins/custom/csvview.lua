return {
  {
    'hat0uma/csvview.nvim',
    ft = { 'csv', 'tsv' },
    cmd = { 'CsvViewEnable', 'CsvViewDisable', 'CsvViewToggle', 'CsvViewInfo' },
    ---@module 'csvview'
    ---@type CsvView.Options
    opts = {
      parser = {
        comments = { '#', '//' },
      },
      view = {
        -- 'border' 用 │ 分隔列，更像表格；'highlight' 只高亮分隔符
        display_mode = 'border',
      },
      keymaps = {
        -- 文本对象：if / af 选择字段（仅在本 buffer 启用表格视图时生效）
        textobject_field_inner = { 'if', mode = { 'o', 'x' } },
        textobject_field_outer = { 'af', mode = { 'o', 'x' } },
        jump_next_field_end = { '<Tab>', mode = { 'n', 'v' } },
        jump_prev_field_end = { '<S-Tab>', mode = { 'n', 'v' } },
        jump_next_row = { '<Enter>', mode = { 'n', 'v' } },
        jump_prev_row = { '<S-Enter>', mode = { 'n', 'v' } },
      },
    },
    -- auto enable
    init = function()
      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('csvview_autostart', { clear = true }),
        pattern = { 'csv', 'tsv' },
        callback = function()
          require('csvview').enable(0)
        end,
        desc = 'Auto enable csvview',
      })
    end,
  },
}
