local uname = vim.loop.os_uname()

if uname.sysname == "Linux" then
	return {
		"h-hg/fcitx.nvim",
	}
elseif uname.sysname == "Darwin" then
	return {
		"keaising/im-select.nvim",
		config = function()
			require("im_select").setup({})
		end,
	}
end

-- Return nil for other systems
return nil
