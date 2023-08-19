return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
  {
    "tokyonight.nvim",
    name = "tokyonight",
    lazy = false,
    priority = 1000,
    opts = {
      -- style = "day",
      dim_inactive = true,
      lualine_bold = true,
      on_highlights = function(highlight, colors)
        highlight.WinSeparator = { fg = colors.grey, bold = true }
      end,
      on_colors = function(colors)
        colors.gitSigns = {
          add = "#B3D582",
          change = "#EB8A63",
          delete = "#F60B0D",
        }
      end,
    },
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    name = "kanagawa",
    load = "lotus",
    opts = {
      theme = "lotus",
    },
  },
}
