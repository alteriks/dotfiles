-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "one_light",
  theme_toggle = { "one_light", "one_light" },
  -- transparency = true,

  telescope = { style = "bordered" },

  statusline = {
    theme = "default",
    separator_style = "round",
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
