-- https://github.com/stevearc/conform.nvim
-- Format file - ie cut trailing spaces, empty lines, conform to common readability
local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    markdown = { "markdownlint-cli2" },
    sh = { "shfmt" },
    css = { "prettier" },
    yaml = { "yamlfmt" }
    -- html = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    -- timeout_ms = 500,
    async = true,
    quiet = false,
    lsp_fallback = false,
  },
}

require("conform").setup(options)
