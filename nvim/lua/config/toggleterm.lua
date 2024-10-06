local status, toggleterm = pcall(require, "toggleterm")
if not status then
	vim.notify("没有找到 toggleterm")
	return
end

vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)

toggleterm.setup({
	open_mapping = [[<c-\>]],
})
