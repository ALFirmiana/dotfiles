local function gh(repo) return 'https://github.com/' .. repo end

-- [[ Colorscheme ]]
-- You can easily change to a different colorscheme.
-- Change the name of the colorscheme plugin below, and then
-- change the command under that to load whatever the name of that colorscheme is.
--
-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
vim.pack.add {
  gh 'folke/tokyonight.nvim',
  { src = gh 'catppuccin/nvim', name = 'catppuccin' },
}
---@diagnostic disable-next-line: missing-fields
require('tokyonight').setup {
  transparent = true,
  styles = {
    comments = { italic = false }, -- Disable italics in comments
  },
}
require('catppuccin').setup {
  flavour = 'macchiato', -- latte, frappe, macchiato, mocha
  transparent_background = true,
  float = {
    transparent = true, -- enable transparent floating windows
    solid = false, -- use solid styling for floating windows, see |winborder|
  },
  custom_highlights = function(c)
    return {
      LineNr = { fg = c.overlay2 },
      LineNrAbove = { fg = c.overlay2 },
      LineNrBelow = { fg = c.overlay2 },
    }
  end,
}

vim.o.winborder = 'rounded'

-- Load the colorscheme here.
-- Like many other themes, this one has different styles, and you could load
-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
-- vim.cmd.colorscheme 'catppuccin-macchiato'
vim.cmd.colorscheme 'catppuccin'

-- vim: ts=2 sts=2 sw=2 et
