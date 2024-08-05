local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- yuyuko colorsheme
	"Enonya/yuyuko.vim",
	-- transparent background
	"xiyaowong/transparent.nvim",
	-- Vscode-like pictograms
	{
		"onsails/lspkind.nvim",
		event = { "VimEnter" },
	},
	-- Auto-completion engine
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"lspkind.nvim",
			"hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
			"hrsh7th/cmp-buffer", -- buffer auto-completion
			"hrsh7th/cmp-path", -- path auto-completion
			"hrsh7th/cmp-cmdline", -- cmdline auto-completion
		},
		config = function()
			require("config.nvim-cmp")
		end,
	},
	-- Code snippet engine
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
	},
	-- LSP manager
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	-- formatter
    {
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			require("config.mason-null-ls")
		end,
	},
	--{
	--	"mhartington/formatter.nvim",
	--	config = function()
	--		require("config.formatter")
	--	end,
	--},
	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("config.telescope")
		end,
	},
	-- vimtex and markdown
	{
		"lervag/vimtex",
		lazy = false,
		init = function()
			vim.g.vimtex_view_method = "zathura"
			vim.g.vimtex_quickfix_open_on_warning = 0
			-- see :h vimtex quickfix for more information
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		config = function()
			require("config.markdown-preview")
		end,
	},
	"h-hg/fcitx.nvim",
	-- toggleterm for terminal in nvim
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("config.toggleterm")
		end,
	},
	-- FileTree
	"nvim-tree/nvim-web-devicons",
	{
		"nvim-tree/nvim-tree.lua",
		event = { "VimEnter" },
		config = function()
			require("config.nvim-tree")
		end,
	},
	-- Bufferline
	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("config.bufferline")
		end,
	},
	-- Lualine
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("config.lualine")
		end,
	},
	-- nvim treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("config.nvim-treesitter")
		end,
	},
	"HiPhish/rainbow-delimiters.nvim",
	-- auto-pair
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("config.nvim-autopairs")
		end,
	},
	-- hlchunk
	{
		"shellRaining/hlchunk.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("config.hlchunk")
		end,
	},
	-- sentiment
	{
		"utilyre/sentiment.nvim",
		event = "VeryLazy",
		init = function()
			vim.g.loaded_matchparen = 1
		end,
		config = function()
			require("config.sentiment")
		end,
	},
})
