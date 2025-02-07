return {
	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
				options = {
					offsets = {
						{
							filetype = "neo-tree",
							text = "File Explorer",
							text_align = "left",
							separator = true,
						},
					},
					separator_style = "thin",
				},
			})
		end,
	},
}
