return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      yadm = { enable = true },
      -- linehl = true, -- Toggle with `:Gitsigns toggle_linehl`
      -- show_deleted = true, -- Toggle with `:Gitsigns toggle_deleted
    },
  },

  -- require("leap").add_default_mappings(),
  {
    "ggandor/leap.nvim",
    opts = {
      add_default_mappings = true,
    },
  },
  -- --   leap.add_default_mappings(true)
  -- -- opts = {
  --   vim.keymap.set({ "x", "o" }, x, "<Plug>(leap-forward-till)"),
  -- },
  -- },
  -- {
  --   "echasnovski/mini.comment",
  --   event = "VeryLazy",
  --   opts = {
  --     options = {
  --       custom_commentstring = function()
  --         return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
  --       end,
  --     },
  --   },
  -- },

  -- {
  --   "phaazon/hop.nvim",
  --   opts = {},
  -- },

  {
    "chrisbra/Recover.vim",
    lazy = true,
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      highlights = {
        buffer_selected = {
          fg = "#B3D582",
          -- bg = "#7279a8",
        },
        close_button_selected = {
          -- bg = "#7279a8",
        },
      },
      options = {
        indicator = {
          icon = "",
          style = "underline",
        },
        -- numbers = "both",
        diagnostics = "nvim_lsp", -- show  1  12 indicators in bufferline

        -- groups = {
        --   options = {
        --     toggle_hidden_on_enter = true, -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
        --   },
        --   items = {
        --     {
        --       name = "Tests", -- Mandatory
        --       highlight = { underline = true, sp = "blue" }, -- Optional
        --       priority = 2, -- determines where it will appear relative to other groups (Optional)
        --       icon = "", -- Optional
        --       matcher = function(buf) -- Mandatory
        --         return buf.name:match("%_test") or buf.name:match("%_spec")
        --       end,
        --     },
        --     {
        --       name = "Docs",
        --       highlight = { underline = true, sp = "green" },
        --       auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
        --       matcher = function(buf)
        --         return buf.name:match("%.md") or buf.name:match("%.txt")
        --       end,
        --       separator = { -- Optional
        --         style = require("bufferline.groups").separator.tab,
        --       },
        --     },
        --   },
        -- },
      },
    },
  },
}
