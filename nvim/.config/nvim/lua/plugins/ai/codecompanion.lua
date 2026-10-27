local function gh(repo) return 'https://github.com/' .. repo end

-- [[ AI: CodeCompanion driving dsh over ACP ]]
--
-- dsh (DeepSeek Harness) exposes an Agent Client Protocol v1 server on stdio:
--
--   dsh --profile acp        -- the `acp` profile (bootstraps on first use)
--   dsh-acp-server           -- the same server from the standalone npm bin
--
-- CodeCompanion spawns it once per chat with cwd = Neovim's cwd, so `:cd` into
-- the project before opening a chat. The agent reads/writes files itself: its
-- tools run in-process with dsh's own sandbox, approvals come back to Neovim as
-- permission dialogs, and nothing round-trips through `fs/read_text_file`.
vim.pack.add {
  gh 'olimorris/codecompanion.nvim',
  gh 'nvim-lua/plenary.nvim',
  gh 'nvim-treesitter/nvim-treesitter',
  gh 'MeanderingProgrammer/render-markdown.nvim',
}

require('codecompanion').setup {
  adapters = {
    acp = {
      dsh = {
        name = 'dsh',
        formatted_name = 'DeepSeek Harness',
        type = 'acp',
        roles = { llm = 'assistant', user = 'user' },
        -- dsh advertises `promptCapabilities.image`, so pasted screenshots work
        opts = { vision = true },

        commands = {
          default = { 'dsh', '--profile', 'acp' },
        },

        defaults = {
          -- dsh ignores MCP servers it is not asked to start; the field has to
          -- be an array for the `session/new` handshake
          mcpServers = {},
          -- The first `session/new` boots the whole harness, so leave headroom
          timeout = 60000,
        },

        -- Sent verbatim as the `initialize` params; `protocolVersion` is
        -- mandatory or the server rejects the handshake with -32602
        parameters = {
          protocolVersion = 1,
          clientInfo = {
            name = 'CodeCompanion.nvim',
            version = '1.0.0',
          },
        },

        handlers = {
          request = {
            -- ACP agents receive their user messages as a flat list of blocks
            build_messages = require('codecompanion.adapters.acp.helpers').build_messages,
          },
        },
      },
    },
  },
  interactions = {
    chat = {
      adapter = 'dsh',
      roles = {
        -- icons carried over from the old config: oct-copilot / oct-comment_discussion
        llm = function(adapter) return '  (' .. adapter.formatted_name .. ')' end,
        user = '  (Me)',
      },
    },
    inline = { adapter = 'dsh' },
  },
  display = {
    chat = {
      window = {
        layout = 'vertical',
        width = 0.45,
        border = 'rounded',
      },
    },
  },
}

vim.keymap.set('n', '<leader>aa', '<cmd>CodeCompanionChat Toggle<cr>', { desc = 'Toggle AI chat (dsh)' })
vim.keymap.set('n', '<leader>an', '<cmd>CodeCompanionChat<cr>', { desc = 'New AI chat (dsh)' })
vim.keymap.set({ 'n', 'v' }, '<leader>ai', '<cmd>CodeCompanion<cr>', { desc = 'AI inline prompt (dsh)' })
vim.keymap.set('n', '<leader>ap', '<cmd>CodeCompanionActions<cr>', { desc = 'AI action palette' })

-- vim: ts=2 sts=2 sw=2 et
