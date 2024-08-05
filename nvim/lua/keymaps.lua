-- define common options
local opts = {
	noremap = true, -- non-recursive
	silent = true, -- do not show message
}

-----------------
-- Normal mode --
-----------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
vim.keymap.set("n", "<C-\\>", ":vsplit new<CR>", opts)
vim.keymap.set("n", "<C-->", ":close<CR>", opts)
vim.keymap.set("n", "<C-S-h>", ":BufferLineCyclePrev<CR>", opts)
vim.keymap.set("n", "<C-S-l>", ":BufferLineCycleNext<CR>", opts)
vim.keymap.set("n", "<leader>q", ":bd<CR>", opts)
-- Resize with arrows
-- delta: 2 lines
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Quick move
vim.keymap.set({ "v", "n" }, "J", "5j", opts)
vim.keymap.set({ "v", "n" }, "K", "5k", opts)

-- Add blank line
vim.keymap.set("n", "<CR>", "o<ESC>", opts)
vim.keymap.set("n", "<S-CR>", "O<ESC>", opts)
-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)
