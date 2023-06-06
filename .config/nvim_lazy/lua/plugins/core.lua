-- https://github.com/LazyVim/LazyVim/issues/524
return {
  -- disable leap and flit
  -- { "ggandor/leap.nvim", enabled = false },
  { "tiagovla/scope.nvim", opts = {} },

  { "ggandor/flit.nvim", enabled = false },
  {
    "echasnovski/mini.jump",
    version = false,
    enabled = true,
    mappings = {
      forward = "f",
      backward = "F",
      forward_till = "t",
      backward_till = "T",
      repeat_jump = ";",
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ignore_install = { "help" }
    end,
  },
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
}
