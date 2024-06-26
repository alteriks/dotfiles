-- [[ Configure and install plugins ]]

-- function needed by "f-person/auto-dark-mode.nvim",
local function set_theme(name)
  local cur_theme = require('nvconfig').ui.theme
  require('nvchad.utils').replace_word(cur_theme, name)
  require('nvconfig').ui.theme = name
  require('base46').load_all_highlights()
end

return {

  {
    'Pocco81/true-zen.nvim',
    config = function()
      require('true-zen').setup {
        -- your config goes here
        -- or just leave it empty :)
      }
    end,
    keys = {
      {
        '<leader>zn',
        '<cmd>TZNarrow<cr>',
        mode = 'n',
        desc = 'Narrow focused',
        noremap = true,
      },
      {
        '<leader>zn',
        "<cmd>'<,'>TZNarrow<cr>",
        mode = 'v',
        desc = 'Ranged narrow focused',
        noremap = true,
      },
      {
        '<leader>zf',
        '<cmd>TZFocus<cr>',
        mode = 'n',
        desc = 'Focued mode',
        noremap = true,
      },
      {
        '<leader>zm',
        '<cmd>TZMinimalist<cr>',
        mode = 'n',
        desc = 'Minimalist mode',
        noremap = true,
      },
      {
        '<leader>za',
        '<cmd>TZAtaraxis<cr>',
        mode = 'n',
        desc = 'Ataraxis mode',
        noremap = true,
      },
    },
  },
  -- {
  --   'folke/zen-mode.nvim',
  --   opts = {
  --     -- your configuration comes here
  --     -- or leave it empty to use the default settings
  --     -- refer to the configuration section below
  --   },
  -- },
  { 'echasnovski/mini.surround', version = false, recommended = true, event = 'VeryLazy', opts = {
    highlight_duration = 500,
  } },
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

  -- TODO: is it fast/slow? change leadmultispace/multispace
  -- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣', leadmultispace = '│   ', multispace = '│ ' }
  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'User FilePost',
    opts = {
      indent = { char = '│', highlight = 'IblChar' },
      scope = { char = '│', highlight = 'IblScopeChar' },
    },
    config = function(_, opts)
      dofile(vim.g.base46_cache .. 'blankline')

      local hooks = require 'ibl.hooks'
      hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
      require('ibl').setup(opts)

      dofile(vim.g.base46_cache .. 'blankline')
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

  -- Watches darkman (dbus org.freedesktop.impl.portal.desktop.darkman)
  -- for theme changes
  {
    'f-person/auto-dark-mode.nvim',
    event = 'VeryLazy',
    opts = {
      update_interval = 1000,
      set_dark_mode = function()
        set_theme 'onedark'
      end,
      set_light_mode = function()
        set_theme 'one_light'
      end,
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
    event = 'VeryLazy',
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

  -- modular approach: using `require 'path/name'` will
  -- include a plugin definition from file lua/path/name.lua

  require 'kickstart/plugins/harpoon',
  require 'kickstart/plugins/autopairs',
  require 'kickstart/plugins/cmp',
  require 'kickstart/plugins/gitsigns',
  require 'kickstart/plugins/flash',
  require 'kickstart/plugins/telescope',
  require 'kickstart/plugins/telescope-zoxide',
  require 'kickstart/plugins/todo-comments',
  require 'kickstart/plugins/treesitter',
  require 'kickstart/plugins/toggleterm',
  require 'kickstart/plugins/which-key',

  -- require 'kickstart/plugins/tokyonight',
  -- require 'kickstart/plugins/mini',

  --  Here are some example plugins that I've included in the Kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).
  --
  -- require 'kickstart.plugins.indent_line',
  require 'kickstart.plugins.neo-tree',

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  { import = 'custom.plugins' },
}

-- vim: ts=2 sts=2 sw=2 et
