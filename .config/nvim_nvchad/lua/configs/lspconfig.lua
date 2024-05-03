-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  "html",
  "cssls",
  "ansiblels",
  "markdown_oxide",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

lspconfig.ansiblels.setup {
  cmd = { "ansible-language-server", "--stdio" },
  ["redhat.telemetry.enabled"] = false,
  redhat = {
    telemetry = {
      enabled = false,
    },
  },
  filetypes = { "yaml.ansible" },
  settings = {
    ansible = {
      validation = {
        enabled = true, -- use ansible --syntax-check
        lint = {
          enabled = false, -- ansible-lint already launched by conform.nvim
        },
      },
    },
  },
}
