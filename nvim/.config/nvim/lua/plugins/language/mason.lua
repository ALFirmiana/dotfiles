-- Mason-based installation of LSP servers, tools and DAP adapters.
--
-- On NixOS every tool is installed through Nix, so this file does nothing at
-- all there. It must be loaded after `plugins.language.lspconfig` (for the
-- server list) and `plugins.language.debug` (so nvim-dap is already loaded).
if vim.uv.fs_stat '/etc/NIXOS' ~= nil then return end

local function gh(repo) return 'https://github.com/' .. repo end

local servers = require('plugins.language.lspconfig').servers

vim.pack.add {
  gh 'mason-org/mason.nvim',
  gh 'mason-org/mason-lspconfig.nvim',
  gh 'WhoIsSethDaniel/mason-tool-installer.nvim',
  gh 'jay-babu/mason-nvim-dap.nvim',
}

require('mason').setup {}

-- Translates between nvim-lspconfig server names and mason.nvim package names
-- (e.g. lua_ls <-> lua-language-server).
require('mason-lspconfig').setup {
  automatic_enable = false, -- Change this to true if you want to automatically enable servers installed via :Mason
}

-- Ensure the servers and tools above are installed.
--
-- To check the current status of installed tools and/or manually install
-- other tools, you can run
--    :Mason
--
-- You can press `g?` for help in this menu.
local NOT_MASON = { 'rust_analyzer', 'nil_ls' }
local ensure_installed = vim.tbl_filter(function(name) return not vim.tbl_contains(NOT_MASON, name) end, vim.tbl_keys(servers))
vim.list_extend(ensure_installed, {
  -- You can add other tools here that you want Mason to install
})

require('mason-tool-installer').setup { ensure_installed = ensure_installed }

-- Makes a best effort to setup the various debuggers with reasonable debug
-- configurations. nvim-dap is already loaded by `plugins/language/debug.lua`.
require('mason-nvim-dap').setup {
  automatic_installation = true,
  handlers = {},
  ensure_installed = {
    -- Add debuggers here, e.g. 'delve' or 'python'
  },
}

-- vim: ts=2 sts=2 sw=2 et
