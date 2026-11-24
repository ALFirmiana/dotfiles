-- [[ Intro to `vim.pack` ]]
-- `vim.pack` is a new plugin manager built into Neovim,
--  which provides a Lua interface for installing and managing plugins.
--
--  See `:help vim.pack`, `:help vim.pack-examples` or the
--  excellent blog post from the creator of vim.pack and mini.nvim:
--  https://echasnovski.com/blog/2026-03-13-a-guide-to-vim-pack
--
--  To inspect plugin state and pending updates, run
--    :lua vim.pack.update(nil, { offline = true })
--
--  To update plugins, run
--    :lua vim.pack.update()
--
--
--  Throughout the rest of the config there will be examples
--  of how to install and configure plugins using `vim.pack`.
--
--  In this section we set up some autocommands to run build
--  steps for certain plugins after they are installed or updated.

local function run_build(name, cmd, cwd)
  local result = vim.system(cmd, { cwd = cwd }):wait()
  if result.code ~= 0 then
    local stderr = result.stderr or ''
    local stdout = result.stdout or ''
    local output = stderr ~= '' and stderr or stdout
    if output == '' then output = 'No output from build command.' end
    vim.notify(('Build failed for %s:\n%s'):format(name, output), vim.log.levels.ERROR)
  end
end

-- This autocommand runs after a plugin is installed or updated and
--  runs the appropriate build command for that plugin if necessary.
--
-- See `:help vim.pack-events`
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name = ev.data.spec.name
    local kind = ev.data.kind
    if kind ~= 'install' and kind ~= 'update' then return end

    if name == 'telescope-fzf-native.nvim' and vim.fn.executable 'make' == 1 then
      run_build(name, { 'make' }, ev.data.path)
      return
    end

    if name == 'LuaSnip' then
      if vim.fn.has 'win32' ~= 1 and vim.fn.executable 'make' == 1 then run_build(name, { 'make', 'install_jsregexp' }, ev.data.path) end
      return
    end

    if name == 'nvim-treesitter' then
      if not ev.data.active then vim.cmd.packadd 'nvim-treesitter' end
      vim.cmd 'TSUpdate'
      return
    end
  end,
})

-- [[ Plugin maintenance keymaps ]]
-- Both land in the same review tabpage: `:write` to apply, `:quit` to discard.
--
--   <leader>pu  update to the latest upstream revision (rewrites the lockfile)
--   <leader>ps  sync to `nvim-pack-lock.json` (use after pulling it from
--               another machine; does not care what upstream currently is)
--
-- `:packupdate` (Nvim 0.13+) is just a command wrapper around
--  `vim.pack.update()`. Use it when it exists for the "latest" case so this
--  keeps tracking upstream behavior; there is no command equivalent for the
--  lockfile target, so call the Lua API directly.
local function pack_update(target)
  if target == 'version' and vim.fn.exists ':packupdate' == 2 then
    vim.cmd 'packupdate'
    return
  end
  vim.pack.update(nil, { target = target })
end

vim.keymap.set('n', '<leader>pu', function() pack_update 'version' end, { desc = '[P]lugin [U]pdate to latest' })

vim.keymap.set('n', '<leader>ps', function() pack_update 'lockfile' end, { desc = '[P]lugin [S]ync to lockfile' })

-- vim: ts=2 sts=2 sw=2 et
