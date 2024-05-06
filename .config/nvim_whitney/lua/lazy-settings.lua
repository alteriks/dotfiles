return {
  {
    'NvChad/base46',
    branch = 'v2.5',
    event = 'VimEnter',
    build = function()
      require('base46').load_all_highlights()
    end,
  },
  {
    'NvChad/ui',
    branch = 'v2.5',
    event = 'VimEnter',
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
}
