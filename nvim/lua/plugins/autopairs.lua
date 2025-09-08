-- autopairs
-- https://github.com/windwp/nvim-autopairs

return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	-- Optional dependency
	dependencies = { "hrsh7th/nvim-cmp" },
	config = function()
		require("nvim-autopairs").setup({
			enable_check_bracket_line = false,
		})
		-- set rules
		local Rule = require("nvim-autopairs.rule")
		local cond = require("nvim-autopairs.conds")
		require("nvim-autopairs").add_rules({
			-- disable autopairs of ' and ` for scmc and scheme
			Rule("`", "", { "scmc", "scheme" }),
			Rule("'", "", { "scmc", "scheme" }),
			-- enable autopairs of $ for typst
			Rule("$", "$", { "typst" }):with_move(cond.done()),
            Rule(" ", " ", { "typst" })
                :with_pair(cond.after_regex("$"))
                :with_move(cond.done()),
		})
		-- If you want to automatically add `(` after selecting a function or method
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
