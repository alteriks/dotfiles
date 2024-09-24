return {

  -- show a diff, whenever recovering a buffer
  {
    'chrisbra/Recover.vim',
    -- Use :RecoverPluginFinish, to  delete the no-longer-needed swap file when in the recovered window,
    -- this will delete the swapfile, close the diff window, and end the diff/merge process.
  },

  -- Use zen mode to copy when OSC52 is unavailable
  {
    'folke/zen-mode.nvim',
    event = 'VeryLazy',
    opts = {
      window = {
        options = {
          signcolumn = 'no', -- disable signcolumn
          number = false, -- disable number column
          relativenumber = false, -- disable relative numbers
          cursorline = false, -- disable cursorline
          cursorcolumn = false, -- disable cursor column
          foldcolumn = '0', -- disable fold column
          -- list = false, -- disable whitespace characters
        },
      },
      plugins = {
        kitty = {
          enabled = true,
          font = '+4', -- font size increment
        },
      },
    },
  },
  {
    'folke/persistence.nvim',
    event = 'BufReadPre',
    opts = {},
  },
  {
    'NvChad/nvim-colorizer.lua',
    event = 'User FilePost',
    opts = { user_default_options = { names = false } },
    config = function(_, opts)
      require('colorizer').setup(opts)

      -- execute colorizer as soon as possible
      vim.defer_fn(function()
        require('colorizer').attach_to_buffer(0)
      end, 0)
    end,
  },

  {
    'echasnovski/mini.icons',
    version = false,
    recommended = true,
    event = 'VeryLazy',
    opts = {},
  },
  {
    'echasnovski/mini.surround',
    version = false,
    recommended = true,
    event = 'VeryLazy',
    opts = {
      highlight_duration = 500,
    },
  },
  -- { 'echasnovski/mini.pairs', version = false },
  -- {
  --   "kylechui/nvim-surround",
  --   version = "*", -- Use for stability; omit to use `main` branch for the latest features
  --   event = "VeryLazy",
  --   config = function()
  --       require("nvim-surround").setup({
  --           -- Configuration here, or leave empty to use defaults
  --       })
  --   end
  -- },
  {
    'mbbill/undotree',
    event = 'VeryLazy',
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'User FilePost',
    opts = {
      indent = { char = '│', highlight = 'IblChar' },
      scope = { char = '│', highlight = 'IblScopeChar' },
    },
    config = function(_, opts)
      local hooks = require 'ibl.hooks'
      hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
      require('ibl').setup(opts)
    end,
  },

  {
    'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
    event = 'VeryLazy',
  },

  -- "gc" to comment visual regions/lines
  -- version 0.10 includes commenting
  -- { 'numToStr/Comment.nvim', event = 'VeryLazy', opts = {} },

  {
    'lambdalisue/suda.vim',
    -- options.lua -> vim.g.suda_smart_edit
    lazy = false,
  },

  -- Used by plugins with '.' repeat
  -- ie lewis6991/gitsigns.nvim - ghs (Git Hunk Stage) can be repeated with '.'
  {
    'tpope/vim-repeat',
    event = 'VeryLazy',
  },

  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      -- add any options here
      views = {
        cmdline_popup = {
          position = {
            row = 3,
            col = '70%',
          },
        },
        popupmenu = {
          relative = 'editor',
          position = {
            row = 6,
            col = '70%',
          },
          size = {
            width = 60,
          },
          border = {
            style = 'rounded',
            padding = { 0, 1 },
          },
          win_options = {
            winhighlight = { Normal = 'Normal', FloatBorder = 'NoiceCmdlinePopupBorder' },
          },
        },
      },
      presets = {
        bottom_search = true,
      },
      -- cmdline = {
      --   enabled = true,
      -- },
      notify = {
        enabled = false,
      },
      messages = {
        enabled = false,
      },
      popupmenu = {
        enabled = true,
      },
      lsp = {
        progress = {
          enabled = false,
        },
        signature = {
          enabled = false,
        },
        hover = {
          enabled = false,
        },
        messages = {
          enabled = false,
        },
      },
      health = {
        checker = true, -- Disable if you don't want health checks to run
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
    },
  },

  {
    'kdheepak/lazygit.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvim-lua/plenary.nvim', -- optional for floating window border decoration
    },
  },
  { -- Ansible filedetect + run
    'mfussenegger/nvim-ansible',
    lazy = false,
    -- event = 'VeryLazy',
  },
  {
    'otavioschwanck/arrow.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      show_icons = true,
      leader_key = ' A', -- Recommended to be a single key
      buffer_leader_key = 'm', -- Per Buffer Mappings
    },
  },

  require 'kickstart/plugins/autopairs',
  require 'kickstart/plugins/cmp',
  require 'kickstart/plugins/dashboard',
  require 'kickstart/plugins/flash',
  require 'kickstart/plugins/gitsigns',
  -- require 'kickstart/plugins/harpoon',
  require 'kickstart/plugins/neo-tree',
  require 'kickstart/plugins/telescope',
  require 'kickstart/plugins/telescope-zoxide',
  require 'kickstart/plugins/todo-comments',
  require 'kickstart/plugins/toggleterm',
  require 'kickstart/plugins/treesitter',
  require 'kickstart/plugins/which-key',
}

-- vim: ts=2 sts=2 sw=2 et
