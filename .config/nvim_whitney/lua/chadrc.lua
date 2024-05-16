-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

-- ---@type ChadrcConfig
local M = {}
M.stbufnr = function()
  return vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
end

M.ui = {
  -- theme = 'one_light', -- brakes highlight ie BUG gets dark red
  -- theme_toggle = { 'ayu_light', 'one_light' },
  -- transparency = true,

  telescope = { style = 'bordered' },

  statusline = {
    order = {
      'mode',
      'file',
      -- 'git',
      'git_color',
      '%=',
      -- arrow.text_for_statusline_with_icons(),
      -- '%=',
      -- 'lsp_msg',
      'diagnostics',
      'lsp',
      'cwd',
      'cursor',
    },
    -- module = {
    --   arrow = function()
    --     local st_arrow = require 'arrow.statusline'
    --     return {
    --       st_arrow.text_for_statusline_with_icons(),
    --     }
    --   end,
    -- },
    modules = {
      -- The default cursor module is override
      git_color = function()
        if not vim.b[M.stbufnr()].gitsigns_head or vim.b[M.stbufnr()].gitsigns_git_status then
          return ''
        end

        local git_status = vim.b[M.stbufnr()].gitsigns_status_dict
        local added = (git_status.added and git_status.added ~= 0) and ('%#GitSignsAdd#' .. '  ' .. git_status.added) or ''
        local changed = (git_status.changed and git_status.changed ~= 0) and ('%#GitSignsChange#' .. '  ' .. git_status.changed) or ''
        local removed = (git_status.removed and git_status.removed ~= 0) and ('%#GitSignsDelete#' .. '  ' .. git_status.removed) or ''
        local branch_name = '%#gitcommitBranch#' .. ' ' .. git_status.head

        return ' ' .. branch_name .. added .. changed .. removed
      end,
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
