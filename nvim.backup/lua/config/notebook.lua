local status, notebook = pcall(require, "notebook")
if not status then
	vim.notify("没有找到 notebook.nvim")
	return
end

notebook.setup({
	-- Whether to insert a blank line at the top of the notebook
	insert_blank_line = true,

	-- Whether to display the index number of a cell
	show_index = true,

	-- Whether to display the type of a cell
	show_cell_type = true,

	-- Style for the virtual text at the top of a cell
	virtual_text_style = { fg = "lightblue", italic = true },
})
