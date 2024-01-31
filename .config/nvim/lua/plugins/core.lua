-- https://github.com/LazyVim/LazyVim/issues/524
return {

  -- replace pair plugin
  { "echasnovski/mini.pairs", enabled = false },
  {
    "windwp/nvim-autopairs",
    enabled = true,
    event = "InsertEnter",
    disable_in_replace_mode = false,
    opts = {
      enable_check_bracket_line = true,
      -- change default fast_wrap
      fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = [=[[%'%"%>%]%)%}%,]]=],
        end_key = "$",
        before_key = "h",
        after_key = "l",
        cursor_pos_before = true,
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        manual_position = true,
        highlight = "Search",
        highlight_grey = "Comment",
      },
      -- map_c_w = true,
    },
  },
  {
    "mikesmithgh/kitty-scrollback.nvim",
    enabled = true,
    lazy = true,
    cmd = { "KittyScrollbackGenerateKittens", "KittyScrollbackCheckHealth" },
    -- version = '*', -- latest stable version, may have breaking changes if major version changed
    version = "^4.0.0", -- pin major version, include fixes and features that do not have breaking changes
    opts = { number = true },
    config = function()
      require("kitty-scrollback").setup()
    end,
  },
  { "towolf/vim-helm" },
  { "mandos/nvim-helm" },
  -- https://www.reddit.com/r/neovim/comments/12ub997/how_to_prevent_yaml_ls_from_attaching_to_helm/
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
  --
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
    keys = {
      -- Don't respect .gitignore (no_ignore = true) and show all files
      {
        "<leader>ff",
        "<cmd>lua require('telescope.builtin').find_files({ no_ignore = true})<cr>",
        desc = "Find Files",
      },
      {
        "<leader>ff",
        "<cmd>lua require('telescope.builtin').find_files({ no_ignore = true, cwd = false})<cr>",
        desc = "Find Files (cwd)",
      },
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
      exit_when_last = true,
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
        {
          ft = "noice",
          size = { height = 0.4 },
          filter = function(buf, win)
            return vim.api.nvim_win_get_config(win).relative == ""
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
        "neo-tree",
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    opts = {
      keywords = {
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
      },
    },
  },
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}
