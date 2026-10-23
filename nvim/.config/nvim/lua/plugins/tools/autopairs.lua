-- autopairs
-- https://github.com/windwp/nvim-autopairs

return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = function()
    local npairs = require 'nvim-autopairs'
    local Rule = require 'nvim-autopairs.rule'
    local cond = require 'nvim-autopairs.conds'

    npairs.setup {
      enable_check_bracket_line = false,
    }

    npairs.add_rules {
      Rule('$', '$', { 'typst' }):with_move(cond.done()),
    }

    for _, pair in ipairs { '`', "'" } do
      for _, rule in ipairs(npairs.get_rules(pair)) do
        rule.not_filetypes = vim.list_extend(rule.not_filetypes or {}, { 'scmc', 'scheme' })
      end
    end

    npairs.force_attach()
  end,
}
