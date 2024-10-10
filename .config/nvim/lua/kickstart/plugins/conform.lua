return {
  { -- Autoformat
    'stevearc/conform.nvim',
    lazy = false,
    -- FIXME: conflict with telescope SPC+f
    keys = {
      {
        '<leader>F',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      -- If this is set, Conform will run the formatter on save.
      -- It will pass the table to conform.format().
      -- This can also be a function that returns the table.
      format_on_save = {
        -- I recommend these options. See :help conform.format for details.
        lsp_fallback = true,
        timeout_ms = 500,
      },
      -- If this is set, Conform will run the formatter asynchronously after save.
      -- It will pass the table to conform.format().
      -- This can also be a function that returns the table.
      format_after_save = {
        lsp_fallback = true,
      },
      formatters_by_ft = {
        css = { 'prettier' },
        go = { 'goimports', 'gofumpt' },
        html = { 'prettier' },
        lua = { 'stylua' },
        markdown = { 'markdownlint' },
        sh = { 'shfmt' },
        yaml = { 'yamlfmt' }, -- ~/.config/yamlfmt/yamlfmt.yml
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { "prettierd", "prettier" } },
      },
      -- formatters = {
      --   markdownlint = {
      --     cmd = 'markdownlint',
      --     prepend_args = { '-c', '~/.config/markdownlint/markdownlint.yaml ' },
      --   },
      -- },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
