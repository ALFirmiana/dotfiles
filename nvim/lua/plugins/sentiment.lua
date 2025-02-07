return {
	{
		"utilyre/sentiment.nvim",
		event = "VeryLazy",
		init = function()
			vim.g.loaded_matchparen = 1
		end,
		config = function()
			require("sentiment").setup({})
		end,
	},
}
