return {
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup({
				open_mapping = [[<c-ESC>]],
				direction = "float",
				float_opts = {
					border = "curved",
				},
			})
		end,
		keys = [[<c-ESC>]],
	},
}
