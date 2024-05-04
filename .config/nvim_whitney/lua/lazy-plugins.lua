-- [[ Configure and install plugins ]]

-- function needed by "f-person/auto-dark-mode.nvim",
local function set_theme(name)
  local cur_theme = require('nvconfig').ui.theme
  require('nvchad.utils').replace_word(cur_theme, name)
  require('nvconfig').ui.theme = name
  require('base46').load_all_highlights()
end

-- NOTE: Here is where you install your plugins.
return {
  -- defaults = { lazy = true },
  install = { colorscheme = { 'nvchad' } },

  {
    'NvChad/base46',
    branch = 'v2.5',
    event = 'VimEnter',
    -- lazy = false,
    build = function()
      require('base46').load_all_highlights()
    end,
  },

  {
    'NvChad/ui',
    branch = 'v2.5',
    event = 'VimEnter',
    -- lazy = false,
    config = function()
      require 'nvchad'

      local map = vim.keymap.set
      -- tabufline
      map('n', '<leader>b', '<cmd>enew<CR>', { desc = 'buffer new' })

      map('n', '<tab>', function()
        require('nvchad.tabufline').next()
      end, { desc = 'buffer goto next' })

      map('n', '<S-tab>', function()
        require('nvchad.tabufline').prev()
      end, { desc = 'buffer goto prev' })

      map('n', '<leader>x', function()
        require('nvchad.tabufline').close_buffer()
      end, { desc = 'buffer close' })
    end,
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
    'nvim-tree/nvim-web-devicons',
    opts = function()
      return { override = require 'nvchad.icons.devicons' }
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. 'devicons')
      require('nvim-web-devicons').setup(opts)
    end,
  },

  {
    'mbbill/undotree',
    event = 'VeryLazy',
  },

  -- TODO: is it fast/slow? change leadmultispace/multispace
  -- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣', leadmultispace = '│   ', multispace = '│ ' }
  -- {
  --   'lukas-reineke/indent-blankline.nvim',
  --   event = 'User FilePost',
  --   opts = {
  --     indent = { char = '│', highlight = 'IblChar' },
  --     scope = { char = '│', highlight = 'IblScopeChar' },
  --   },
  --   config = function(_, opts)
  --     dofile(vim.g.base46_cache .. 'blankline')
  --
  --     local hooks = require 'ibl.hooks'
  --     hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
  --     require('ibl').setup(opts)
  --
  --     dofile(vim.g.base46_cache .. 'blankline')
  --   end,
  -- },

  -- file managing , picker etc
  {
    'nvim-tree/nvim-tree.lua',
    event = 'VeryLazy',
    cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
    opts = function()
      return require 'nvchad.configs.nvimtree'
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. 'nvimtree')
      require('nvim-tree').setup(opts)
    end,
  },

  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).

  {
    'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
    event = 'VeryLazy',
  },

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.
  --
  --  This is equivalent to:
  --    require('Comment').setup({})

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', event = 'VeryLazy', opts = {} },

  {
    'lambdalisue/suda.vim',
    -- options.lua -> vim.g.suda_smart_edit
    -- event = 'VeryLazy',
    lazy = false,
  },

  -- Used by plugins with '.' repeat
  -- ie lewis6991/gitsigns.nvim - ghs (Git Hunk Stage) can be repeated with '.'
  {
    'tpope/vim-repeat',
    event = 'VeryLazy',
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
    lazy = false, -- without it plugin isn't loaded in time
    -- ft = "yaml.ansible",
  },

  -- modular approach: using `require 'path/name'` will
  -- include a plugin definition from file lua/path/name.lua

  require 'kickstart/plugins/harpoon',
  require 'kickstart/plugins/autopairs',
  require 'kickstart/plugins/cmp',
  require 'kickstart/plugins/conform',
  require 'kickstart/plugins/gitsigns',
  require 'kickstart/plugins/lint',
  require 'kickstart/plugins/lspconfig',
  require 'kickstart/plugins/telescope',
  require 'kickstart/plugins/telescope-zoxide',
  require 'kickstart/plugins/todo-comments',
  require 'kickstart/plugins/treesitter',
  require 'kickstart/plugins/which-key',

  -- require 'kickstart/plugins/tokyonight',
  -- require 'kickstart/plugins/mini',

  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
  --
  --  Here are some example plugins that I've included in the Kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).
  --
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.neo-tree',

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  { import = 'custom.plugins' },

  change_detection = {
    notify = false,
  },

  lockfile = vim.fn.stdpath 'config' .. '/lazy-lock_' .. vim.fn.hostname() .. '.json',
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
  performance = {
    rtp = {
      disabled_plugins = {
        '2html_plugin',
        'tohtml',
        'getscript',
        'getscriptPlugin',
        'gzip',
        'logipat',
        'netrw',
        'netrwPlugin',
        'netrwSettings',
        'netrwFileHandlers',
        'matchit',
        'tar',
        'tarPlugin',
        'rrhelper',
        'spellfile_plugin',
        'vimball',
        'vimballPlugin',
        'zip',
        'zipPlugin',
        'tutor',
        'rplugin',
        'syntax',
        'synmenu',
        'optwin',
        'compiler',
        'bugreport',
        'ftplugin',
      },
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
