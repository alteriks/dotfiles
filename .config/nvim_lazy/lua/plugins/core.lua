-- https://github.com/LazyVim/LazyVim/issues/524
return {
  -- disable leap and flit
  { "tiagovla/scope.nvim", opts = {} },
  {
    "ojroques/nvim-osc52",
    opts = {
      max_length = 0, -- Maximum length of selection (0 for no limit)
      silent = false, -- Disable message on successful copy
      trim = false, -- Trim surrounding whitespaces before copy
    },
  },

  { "ggandor/flit.nvim", enabled = false },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
      { highlight = { label = { current = true } } },
    },
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          -- default options: exact mode, multi window, all directions, with a backdrop
          require("flash").jump()
        end,
      },
      {
        "S",
        mode = { "o", "x" },
        function()
          require("flash").treesitter()
        end,
      },
    },
  },
  -- TODO: folke/flash
  -- {
  --   "echasnovski/mini.jump",
  --   version = false,
  --   enabled = true,
  --   mappings = {
  --     forward = "f",
  --     backward = "F",
  --     forward_till = "t",
  --     backward_till = "T",
  --     repeat_jump = ";",
  --   },
  -- },
  -- TODO: folke/flash
  { "ggandor/leap.nvim", enabled = false },
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
  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    keys = {
    -- stylua: ignore
    { "<leader>ue", function() require("edgy").select() end, desc = "Edgy Select Window" },
    },
    opts = {
      bottom = {
        { ft = "toggleterm", size = { height = 0.4 } },
        {
          ft = "lazyterm",
          title = "LazyTerm",
          size = { height = 0.4 },
          filter = function(buf)
            return not vim.b[buf].lazyterm_cmd
          end,
        },
        "Trouble",
        { ft = "qf", title = "QuickFix" },
        {
          ft = "help",
          size = { height = 20 },
          -- don't open help files in edgy that we're editing
          filter = function(buf)
            return vim.bo[buf].buftype == "help"
          end,
        },
        { ft = "spectre_panel", size = { height = 0.4 } },
      },
      left = {
        {
          title = "Neo-Tree",
          ft = "neo-tree",
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "filesystem"
          end,
          size = { height = 0.5 },
        },
        {
          title = "Neo-Tree Git",
          ft = "neo-tree",
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "git_status"
          end,
          pinned = true,
          open = "Neotree position=right git_status",
        },
        {
          title = "Neo-Tree Buffers",
          ft = "neo-tree",
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "buffers"
          end,
          pinned = true,
          open = "Neotree position=top buffers",
        },
        {
          ft = "Outline",
          pinned = true,
          open = "SymbolsOutline",
        },
        "neo-tree",
      },
    },
  },
}
