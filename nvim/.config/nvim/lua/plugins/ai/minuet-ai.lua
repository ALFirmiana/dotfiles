local function gh(repo) return 'https://github.com/' .. repo end

-- [[ AI completion: DeepSeek FIM via minuet-ai.nvim ]]

vim.pack.add { gh 'milanglacier/minuet-ai.nvim' }

local function deepseek_key()
  local path = vim.fn.expand '~/.dsh/.credentials.yaml'
  if vim.fn.filereadable(path) == 0 then return end
  for _, line in ipairs(vim.fn.readfile(path)) do
    local key = line:match '^%s*DEEPSEEK_API_KEY:%s*(%S+)%s*$'
    if key then return key end
  end
end

require('minuet').setup {
  provider = 'openai_fim_compatible',
  provider_options = {
    openai_fim_compatible = {
      api_key = deepseek_key,
      name = 'DeepSeek',
      end_point = 'https://api.deepseek.com/beta/completions',
      model = 'deepseek-flash',
      optional = { max_tokens = 256, top_p = 0.9 },
    },
  },
  virtualtext = {
    auto_trigger_ft = { 'lua', 'python', 'go', 'rust', 'c', 'cpp', 'javascript', 'typescript', 'sh', 'vim' },
    keymap = {
      accept = '<A-a>',
      accept_line = '<A-l>',
      next = '<A-n>',
      prev = '<A-p>',
      dismiss = '<A-e>',
    },
  },
  n_completions = 1,
  request_timeout = 3,
  context_window = 4000,
}

-- vim: ts=2 sts=2 sw=2 et
