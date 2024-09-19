-- define your colorscheme here
local colorscheme = "yuyuko"

local is_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not is_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

-- Set cursorline style
vim.o.guicursor = "n-v-c-sm-i-ci-ve:block,r-cr-o:hor20"
