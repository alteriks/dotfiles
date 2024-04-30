return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "ansible-language-server", -- Old name, new brand https://github.com/ansible/vscode-ansible
        "ansible-lint",
        "ansiblels",
        "lua-language-server",
        "prettier",
        "markdown-toc", -- Markdown Table of Contents #TODO: 
        "markdown-oxide", --  
        "shfmt", -- Shell formatter - /home/alteriks/.local/share/nvim_nvchad/mason/bin/shfmt -h
        "stylua",
        "yamlfmt",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
      },
    },
  },
}
