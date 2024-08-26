return {
  -- INFO: theme loaded as dependency, check 'akinsho/bufferline.nvim' below
  -- {
  --   'folke/tokyonight.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  -- },
  -- {
  --   'catppuccin/nvim',
  --   name = 'catppuccin',
  --   priority = 1000,
  -- },

  -- Watches darkman (dbus org.freedesktop.impl.portal.desktop.darkman)
  -- for theme changes
  {
    'f-person/auto-dark-mode.nvim',
    event = 'VeryLazy',
    commit = 'e328dc463d238cb7d690fb4daf068eba732a5a14',
    opts = {
      update_interval = 1000,
      -- set_dark_mode = function()
      --   set_theme 'onedark'
      -- end,
      -- set_light_mode = function()
      --   set_theme 'one_light'
      -- end,
      set_dark_mode = function()
        vim.api.nvim_set_option_value('background', 'dark', {})
        vim.cmd 'colorscheme catppuccin-macchiato'
        -- vim.cmd 'colorscheme tokyonight-storm'
      end,
      set_light_mode = function()
        vim.api.nvim_set_option_value('background', 'light', {})
        -- vim.cmd 'colorscheme tokyonight-day'
        vim.cmd 'colorscheme catppuccin-latte'
      end,
    },
  },

  -- {
  --   'itchyny/lightline.vim',
  -- },
  -- {
  --   'nvim-lualine/lualine.nvim',
  --   dependencies = { 'nvim-tree/nvim-web-devicons' },
  -- },
  {
    'akinsho/bufferline.nvim',
    version = '*',
    after = 'catppuccin',
    dependencies = {
      {
        'catppuccin/nvim',
        name = 'catppuccin',
        event = 'VeryLazy',
        config = function()
          require('catppuccin').setup {}
          vim.cmd.colorscheme 'catppuccin-macchiato'
        end,
      },
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      options = {
      -- stylua: ignore
      -- close_command = function(n) LazyVim.ui.bufremove(n) end,
      -- stylua: ignore
      -- right_mouse_command = function(n) LazyVim.ui.bufremove(n) end,
        always_show_bufferline = true,
        separator_style = 'slant',
        indicator = { icon = 'X', style = 'icon' }, -- TODO: how to pick visible color
        -- indicator = { style = 'underline', sp = 'blue' },
        -- highlight = { underline = true, sp = 'blue' }, -- Optional

        diagnostics = 'nvim_lsp',
        -- diagnostics_indicator = function(count, level)
        --   local icon = level:match 'error' and ' ' or ''
        --   return ' ' .. icon .. count
        -- end,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local s = ' '
          for e, n in pairs(diagnostics_dict) do
            local sym = e == 'error' and ' ' or (e == 'warning' and ' ' or ' ')
            s = s .. n .. sym
          end
          return s
        end,
        -- diagnostics_indicator = function(_, _, diag)
        -- local icons = LazyVim.config.icons.diagnostics
        -- local ret = (diag.error and icons.Error .. diag.error .. ' ' or '') .. (diag.warning and icons.Warn .. diag.warning or '')
        -- return vim.trim(ret)
        -- end,
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'Neo-tree',
            highlight = 'Directory',
            text_align = 'left',
          },
        },
        -- ---@param opts bufferline.IconFetcherOpts
        -- get_element_icon = function(opts)
        --   return LazyVim.config.icons.ft[opts.filetype]
        -- end,
      },
    },
    config = function(_, opts)
      require('bufferline').setup(opts)
      highlights = require('catppuccin.groups.integrations.bufferline').get()

      -- Fix bufferline when restoring a session
      vim.api.nvim_create_autocmd({ 'BufAdd', 'BufDelete' }, {
        callback = function()
          vim.schedule(function()
            pcall(nvim_bufferline)
          end)
        end,
      })
    end,
  },

  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    -- init = function()
    --   vim.g.lualine_laststatus = vim.o.laststatus
    --   if vim.fn.argc(-1) > 0 then
    --     -- set an empty statusline till lualine loads
    --     vim.o.statusline = ' '
    --   else
    --     -- hide the statusline on the starter page
    --     vim.o.laststatus = 0
    --   end
    -- end,
    opts = function()
      -- PERF: we don't need this lualine require madness 🤷
      -- local lualine_require = require 'lualine_require'
      -- lualine_require.require = require

      -- local icons = LazyVim.config.icons

      -- vim.o.laststatus = vim.g.lualine_laststatus

      local opts = {
        options = {
          theme = 'auto',
          -- theme = 'tokyonight-storm',
          globalstatus = vim.o.laststatus == 3,
          disabled_filetypes = { statusline = { 'dashboard', 'alpha', 'ministarter' } },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { 'filename' },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = { 'neo-tree', 'lazy' },
      }

      -- do not add trouble symbols if aerial is enabled
      -- And allow it to be overriden for some buffer types (see autocmds)

      return opts
    end,
  },
  {
    'nvim-tree/nvim-web-devicons',
  },
}
