return {
  -- override nvim-cmp and add cmp-emoji
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },
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
      },
    },
  },
}
