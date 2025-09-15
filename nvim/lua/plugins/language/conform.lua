return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = false,
      -- format_on_save = function(bufnr)
      --     -- Disable "format_on_save lsp_fallback" for languages that don't
      --     -- have a well standardized coding style. You can add additional
      --     -- languages here or re-enable it for the disabled ones.
      --     local disable_filetypes = { c = true, cpp = true }
      --     if disable_filetypes[vim.bo[bufnr].filetype] then
      --         return nil
      --     else
      --         return {
      --             timeout_ms = 500,
      --             lsp_format = 'fallback',
      --         }
      --     end
      -- end,
      formatters_by_ft = {
        lua = { 'stylua' },
        c = { 'clang_format' },
        cpp = { 'clang_format' },
        --python = { "black", lsp_format = true },
        python = { lsp_format = true },
        latex = { lsp_format = true },
        typst = { lsp_format = true },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use 'stop_after_first' to run the first available formatter from the list
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
      },
      formatters = {
        clang_format = {
          command = 'clang-format',
          append_args = function()
            return { '--fallback-style=Microsoft' }
          end,
        },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
