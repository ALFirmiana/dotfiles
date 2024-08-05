if vim.g.vscode then
    require("options")
    require("keymaps")
else
	require("options")
	require("keymaps")
	require("plugins")
	require("colorscheme")
	require("lsp")
end
