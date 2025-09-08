return {
	{
		"nvimdev/dashboard-nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
		event = "VimEnter",
		config = function()
			require("dashboard").setup({})
		end,
	},
}
