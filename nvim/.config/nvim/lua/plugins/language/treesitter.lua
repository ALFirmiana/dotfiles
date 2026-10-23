return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      local parsers = {
        'bash',
        'c',
        'diff',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'vim',
        'vimdoc',
      }

      local treesitter = require 'nvim-treesitter'
      treesitter.install(parsers)

      local available = treesitter.get_available()

      local function attach(buf, language)
        if not vim.api.nvim_buf_is_valid(buf) then
          return
        end
        if not vim.treesitter.language.add(language) then
          return
        end
        vim.treesitter.start(buf, language)
        if vim.treesitter.query.get(language, 'indents') then
          vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end

      vim.api.nvim_create_autocmd('FileType', {
        callback = function(event)
          local buf = event.buf
          local language = vim.treesitter.language.get_lang(vim.bo[buf].filetype)
          if not language then
            return
          end
          if vim.tbl_contains(treesitter.get_installed 'parsers', language) then
            attach(buf, language)
          elseif vim.tbl_contains(available, language) then
            treesitter.install(language):await(function()
              attach(buf, language)
            end)
          else
            attach(buf, language)
          end
        end,
      })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    opts = {
      enable = true,
    },
  },
}
