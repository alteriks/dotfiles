-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = 'onedark',
  theme_toggle = { 'ayu_light', 'onedark' },
  -- transparency = true,

  telescope = { style = 'bordered' },

  statusline = {
    order = {
      'mode',
      'file',
      'git',
      -- '%=',
      -- 'lsp_msg',
      '%=',
      'diagnostics',
      'lsp',
      'cwd',
      'cursor',
    },
    theme = 'default',
    separator_style = 'default',
  },
  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
  nvdash = {
    load_on_startup = true,
  },
}

return M
