return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"echasnovski/mini.diff",
	},
	config = function()
		require("mini.diff").setup({
			source = require("mini.diff").gen_source.none(),
		})
		require("codecompanion").setup({
			adapters = {
				deepseek = function()
					return require("codecompanion.adapters").extend("deepseek", {
						env = {
							api_key = os.getenv("LLM_KEY"),
						},
						schema = {
							model = {
								default = "deepseek-chat",
							},
						},
					})
				end,
			},
			strategies = {
				chat = { adapter = "deepseek" },
				inline = {
					adapter = "deepseek",
					keymaps = {
						accept_change = {
							modes = { n = "<leader>a" },
							description = "Accept the suggested changes",
						},
						reject_change = {
							modes = { n = "<leader>r" },
							description = "Reject the suggested changes",
						},
					},
				},
				agent = { adapter = "deepseek" },
			},
			opts = {
				language = "Chinese",
			},
			display = {
				diff = {
					enabled = true,
					close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...
					layout = "vertical", -- vertical|horizontal split for default provider
					opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
					provider = "mini_diff", -- default|mini_diff
				},
			},
		})

		vim.keymap.set("n", "<leader>at", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "Toggle Code Companion Chat" })
		vim.keymap.set("v", "<leader>ae", "<cmd>CodeCompanion /explain<cr>", { desc = "AI explain" })
		vim.keymap.set("v", "<leader>af", "<cmd>CodeCompanion /fix<cr>", { desc = "AI fix" })
		vim.keymap.set("n", "v", "<leader>aa", "<cmd>CodeCompanionActions<cr>", { desc = "AI action" })
	end,
}
