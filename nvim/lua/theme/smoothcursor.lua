return {
	{
		"gen740/SmoothCursor.nvim",
		event = "VimEnter",
		config = function()
			require("smoothcursor").setup({
				type = "matrix",
				matrix = {
					unstop = true,
				},
			})
		end,
	},
}
