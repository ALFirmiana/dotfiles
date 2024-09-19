local status, nvim_treesitter = pcall(require, "nvim-treesitter")
if not status then
	vim.notify("没有找到 nvim-treesitter")
	return
end

nvim_treesitter.setup({
	ensure_installed = { "lua", "python", "c", "cpp", "scheme", "latex", "markdown" },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<CR>",
			node_incremental = "<CR>",
			node_decremental = "<BS>",
			scope_incremental = "<TAB>",
		},
	},
})

vim.treesitter.language.register("scheme", "scmc")
