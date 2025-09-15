-- autopairs
-- https://github.com/windwp/nvim-autopairs

return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = function()
    require('nvim-autopairs').setup {
      enable_check_bracket_line = false,
    }
    -- set rules
    local Rule = require 'nvim-autopairs.rule'
    local cond = require 'nvim-autopairs.conds'
    require('nvim-autopairs').add_rules {
      -- disable autopairs of ' and ` for scmc and scheme
      Rule('`', '', { 'scmc', 'scheme' }),
      Rule("'", '', { 'scmc', 'scheme' }),
      -- enable autopairs of $ for typst
      Rule('$', '$', { 'typst' }):with_move(cond.done()),
      Rule(' ', ' ', { 'typst' }):with_pair(cond.before_text '$' and cond.after_text '$'):with_move(cond.done()),
    }
  end,
}
