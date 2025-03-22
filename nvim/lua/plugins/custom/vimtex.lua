return {
	{
		"lervag/vimtex",
		ft = { "tex", "latex" },
		init = function()
			vim.g.vimtex_view_method = "zathura"
			vim.g.vimtex_quickfix_open_on_warning = 0
			-- see :h vimtex quickfix for more information
		end,
	},
}
