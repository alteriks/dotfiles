--
-- function needed by "f-person/auto-dark-mode.nvim",
local function set_theme(name)
  local cur_theme = require("nvconfig").ui.theme
  require("nvchad.utils").replace_word(cur_theme, name)
  require("nvconfig").ui.theme = name
  require("base46").load_all_highlights()
end

return {
  {
    -- TODO:
    -- "Dockerfile.vim",
    -- event = "VeryLazy",
  },
  -- {
  -- "ThePrimeagen/harpoon",
  -- branch = "harpoon2",
  -- opts = {
  --   menu = {
  --     width = vim.api.nvim_win_get_width(0) - 4,
  --   },
  --   settings = {
  --     save_on_toggle = true,
  --   },
  --   },
  {
    "lambdalisue/suda.vim",
    -- options.lua -> vim.g.suda_smart_edit
    event = "VeryLazy",
  },
  {
    "stevearc/conform.nvim",
    -- event = "BufWritePre", -- TODO: uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- Used by plugins with '.' repeat
  -- ie lewis6991/gitsigns.nvim - ghs (Git Hunk Stage) can be repeated with '.'
  {
    "tpope/vim-repeat",
    event = "VeryLazy",
  },

  -- Watches darkman (dbus org.freedesktop.impl.portal.desktop.darkman)
  -- for theme changes
  {
    "f-person/auto-dark-mode.nvim",
    event = "VeryLazy",
    opts = {
      update_interval = 1000,
      set_dark_mode = function()
        set_theme "onedark"
      end,
      set_light_mode = function()
        set_theme "one_light"
      end,
    },
  },

  {
    "mfussenegger/nvim-lint",
    event = { "VeryLazy", "BufWritePost", "BufReadPost", "InsertLeave" },
    -- event = { "VeryLazy", "BufWritePre", "BufWritePost", "BufReadPost", "InsertLeave" },
    -- event = "VeryLazy",
    config = function()
      require "configs.lint"
    end,
  },
  {
    "mbbill/undotree",
    event = "VeryLazy",
  },

  {
    "jvgrootveld/telescope-zoxide",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      extensions = {
        zoxide = {
          prompt_title = "[ Zoxide Jump ]",
          mappings = {
            -- INFO: Great success!
            ["<C-l>"] = {
              keepinsert = true,
              action = function(selection)
                require("telescope.builtin").find_files { cwd = selection.path }
              end,
            },
          },
        },
      },
    },
  },

  { -- Ansible filedetect + run
    "mfussenegger/nvim-ansible",
    lazy = false, -- without it plugin isn't loaded in time
  },

  {
    "kdheepak/lazygit.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim", -- optional for floating window border decoration
    },
  },

  -- Highlights:
  -- INFO:
  -- WARN:
  -- TODO:
  -- etc
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },

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
        "bash-language-server",
        "lua-language-server",
        "prettier",
        "markdown-toc", -- Markdown Table of Contents #TODO:
        "markdown-oxide", --
        "shfmt", -- Shell formatter - /home/alteriks/.local/share/nvim_nvchad/mason/bin/shfmt -h
        "shellcheck",
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
