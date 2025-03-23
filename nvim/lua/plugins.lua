-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require("lazy").setup({

	-- theme and style
	require("plugins/colorscheme"),

	require("plugins/lualine"),
	-- use lualine instead of bufferline. You can change if freely.
	-- require("plugins/bufferline")

	require("plugins/indent_line"),

	require("plugins/sentiment"),

	require("plugins/todo-comments"),

	require("plugins/gitsigns"),

	-- basic tools
	require("plugins/im"),

	require("plugins/which-key"),

	require("plugins/lastplace"),

	require("plugins/autopairs"),

	require("plugins/surround"),

	require("plugins/telescope"),

	require("plugins/lspconfig"),

	require("plugins/conform"),

	require("plugins/cmp"),

	require("plugins/treesitter"),

	require("plugins/neo-tree"),

	require("plugins/debug"),

	--require("plugins/lint"),

	require("plugins/toggleterm"),

	-- AI assistant
	-- require("plugins/llm"),
	require("plugins.avante"),

	-- language plugins and custom
	-- latex and markdown
	require("plugins/custom/vimtex"),
	require("plugins/custom/markdown-preview"),
	require("plugins/custom/render-markdown"),

	-- ipython
	require("plugins/custom/ipython"),
}, {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})

-- vim: ts=2 sts=2 sw=2 et
