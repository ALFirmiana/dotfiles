return {
  'olimorris/codecompanion.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('codecompanion').setup {
      adapters = {
        http = {
          deepseek = function()
            return require('codecompanion.adapters').extend('deepseek', {
              url = 'https://api.deepseek.com/chat/completions',
              env = {
                api_key = "cmd:sed -n 's/^  DEEPSEEK_API_KEY: *//p' ~/.dsh/.credentials.yaml",
              },
              schema = {
                model = {
                  default = 'deepseek-flash',
                  choices = { ['deepseek-flash'] = { opts = { can_use_tools = true } } },
                },
              },
            })
          end,
        },
      },
      interactions = {
        chat = {
          adapter = 'deepseek',
          roles = {
            llm = function(adapter)
              return '  (' .. adapter.formatted_name .. ')'
            end,
            user = '  (Me)',
          },
        },
        inline = { adapter = 'deepseek' },
      },
      opts = { language = 'Chinese' },
    }
    vim.keymap.set('n', '<leader>aa', '<cmd>CodeCompanionChat Toggle<CR>', { desc = 'CodeCompanion' })
  end,
}
