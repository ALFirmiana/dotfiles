local status, formatter = pcall(require, "formatter")
if not status then
	vim.notify("没有找到 formatter")
	return
end
local util = require("formatter.util")
formatter.setup({
	filetype = {
		lua = { require("formatter.filetypes.lua").stylua },
		c = { require("formatter.filetypes.c").clangformat },
		cpp = { require("formatter.filetypes.cpp").clangformat },
		python = { require("formatter.filetypes.python").ruff },
		tex = { require("formatter.filetypes.tex").latexindent },
		scmc = {
			function()
				return {
					exe = "/home/Firmiana/.local/share/nvim/mason/packages/scheme-formatter/scheme-format",
					args = { "-i", util.escape_path(util.get_current_buffer_file_path()) },
				}
			end,
		},
		scheme = {
			function()
				return {
					exe = "/home/Firmiana/.local/share/nvim/mason/packages/scheme-formatter/scheme-format",
					args = { "-i", util.escape_path(util.get_current_buffer_file_path()) },
				}
			end,
		},
	},
})

vim.keymap.set("n", "<leader>=", ":Format<CR>", { noremap = true, silent = true })
