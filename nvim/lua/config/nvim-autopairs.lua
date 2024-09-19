local status, nvim_autopairs = pcall(require, "nvim-autopairs")
if not status then
    vim.notify("没有找到 nvim-autopairs")
    return
end

local Rule = require('nvim-autopairs.rule')

require("nvim-autopairs").setup({
    enable_check_bracket_line = flase,
})

require("nvim-autopairs").add_rules({
    --disable autopairs of ' and ` for scmc and scheme
    Rule("`","",{"scmc","scheme"}),
    Rule("'","",{"scmc","scheme"}),
})
