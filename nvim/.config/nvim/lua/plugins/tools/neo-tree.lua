local function gh(repo) return 'https://github.com/' .. repo end

-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

vim.pack.add {
  { src = gh 'nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  gh 'nvim-lua/plenary.nvim',
  gh 'MunifTanjim/nui.nvim',
}

require('neo-tree').setup {}

-- Open / focus / close the tree, depending on where the cursor is:
--   * cursor inside the tree          -> close it
--   * real file below the current cwd -> open/focus and reveal that file
--   * anything else (start page, help, terminal, a file outside cwd)
--                                     -> open/focus at the cwd, which keeps
--                                        the root stable and avoids the
--                                        "File not in cwd" prompt
-- `:Neotree focus` covers opening and focusing; the `filetype` check is what
-- makes the mapping close only when the cursor is really inside the tree
-- (`toggle` would close it from any window).
local function is_file_in_cwd(path)
  if path == '' then return false end
  local cwd = vim.fs.normalize(vim.fn.getcwd()) .. '/'
  return vim.fs.normalize(path):sub(1, #cwd) == cwd
end

vim.keymap.set('n', '\\', function()
  if vim.bo.filetype == 'neo-tree' then
    -- `neo_tree_source` is set by neo-tree on its own buffers, so this closes
    -- the source you are actually looking at (filesystem, buffers, ...).
    require('neo-tree.command').execute { action = 'close', source = vim.b.neo_tree_source }
    return
  end

  local path = vim.api.nvim_buf_get_name(0)
  local is_file = vim.bo.buftype == '' and path ~= '' and vim.fn.filereadable(path) == 1
  if is_file and is_file_in_cwd(path) then
    vim.cmd 'Neotree reveal'
  else
    vim.cmd 'Neotree focus'
  end
end, { desc = 'NeoTree open/focus/close', silent = true })

-- vim: ts=2 sts=2 sw=2 et
