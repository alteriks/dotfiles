local diagnostics_icons = {
  Error = ' ',
  Warn = ' ',
  Hint = ' ',
  Info = '󰗖 ',
}

local function diagnostic_indicator(_, _, diagnostics, _)
  local result = {}
  local symbols = { error = diagnostics_icons.Error, warning = diagnostics_icons.Warn, info = diagnostics_icons.Info, hint = diagnostics_icons.Hint }
  for name, count in pairs(diagnostics) do
    if symbols[name] and count > 0 then
      table.insert(result, symbols[name] .. count)
    end
  end
  local res = table.concat(result, ' ')
  return #res > 0 and res or ''
end
return {
  {
    'uloco/bluloco.nvim',
    lazy = false,
    priority = 1000,
    dependencies = { 'rktjmp/lush.nvim' },
    config = function()
      -- your optional config goes here, see below.
    end,
    opts = {},
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    -- event = 'VeryLazy',
    config = function()
      -- -- Get the current hour
      -- local current_hour = tonumber(os.date '%H')
      --
      -- -- Set the background based on the time of day
      -- if current_hour >= 9 and current_hour < 17 then
      --   -- vim.opt.background = 'light'
      --   vim.cmd.colorscheme 'bluloco-light'
      -- else
      --   require('catppuccin').setup {}
      --   -- vim.opt.background = 'dark'
      --   vim.cmd.colorscheme 'catppuccin-macchiato'
      -- end
    end,
    -- vim.cmd.colorscheme 'vim'
  },
  --
  -- Watches darkman (dbus org.freedesktop.impl.portal.desktop.darkman)
  -- for theme changes
  {
    'f-person/auto-dark-mode.nvim',
    lazy = false,
    priority = 9999,
    commit = 'e328dc463d238cb7d690fb4daf068eba732a5a14',
    -- config = function()
    --   -- Get the current hour
    --   local current_hour = tonumber(os.date '%H')
    --
    --   -- Set the background based on the time of day
    --   if current_hour >= 9 and current_hour < 17 then
    --     -- vim.opt.background = 'light'
    --     vim.cmd.colorscheme 'bluloco-light'
    --   else
    --     require('catppuccin').setup {}
    --     -- vim.opt.background = 'dark'
    --     vim.cmd.colorscheme 'catppuccin-macchiato'
    --   end
    -- end,
    opts = {
      update_interval = 50,
      set_dark_mode = function()
        -- vim.api.nvim_set_option_value('background', 'dark', {})
        vim.cmd 'colorscheme catppuccin-macchiato'
        -- vim.cmd 'colorscheme tokyonight-storm'
      end,
      set_light_mode = function()
        vim.api.nvim_set_option_value('background', 'light', {})
        -- vim.cmd 'colorscheme tokyonight-day'
        -- vim.cmd 'colorscheme catppuccin-latte'
        vim.cmd.colorscheme 'bluloco-light'
      end,
    },
  },

  {
    'akinsho/bufferline.nvim',
    -- version = '*',
    after = 'catppuccin',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      options = {
        always_show_bufferline = true,
        -- separator_style = 'slant',
        -- indicator = { icon = 'X', style = 'icon' }, -- TODO: how to pick visible color
        indicator = { style = 'underline', sp = 'blue' },
        -- highlight = { underline = true, sp = 'blue' }, -- Optional

        diagnostics = 'nvim_lsp',
        diagnostics_indicator = diagnostic_indicator,
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'Neo-tree',
            highlight = 'Directory',
            text_align = 'left',
          },
        },
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
