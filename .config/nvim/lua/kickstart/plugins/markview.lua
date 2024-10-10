return {

  'OXY2DEV/markview.nvim',
  -- lazy = false, -- Recommended
  ft = 'markdown',
  -- opts = {
  --   hybrid_modes = { 'n' },
  --   headings = presets.glow,
  --   -- horizontal_rules = {
  --   --   enable = true,
  --   -- },
  -- },
  config = function()
    local presets = require 'markview.presets'
    require('markview').setup {
      hybrid_modes = { 'n' },
      -- less flicker in hybrid_modes (thx: ✨ Feature: Always keep code block highlight #154)
      -- https://github.com/OXY2DEV/markview.nvim/issues/154
      ignore_nodes = { 'fenced_code_block', 'atx_heading', 'block_quote', 'thematic_break' },
      headings = presets.headings.arrowed,
      -- checkboxes = presets.checkboxes.nerd,
      checkboxes = {
        checked = {
          text = '',
          hl = 'MarkviewCheckboxChecked',
          scope_hl = 'MarkviewCheckboxStriked',
        },
        unchecked = {
          text = '',
          hl = 'MarkviewCheckboxUnchecked',
        },
        custom = {
          {
            match_string = '-',
            text = '',
            hl = 'MarkviewCheckboxPending',
          },
          {
            match_string = '~',
            text = '',
            hl = 'MarkviewCheckboxProgress',
          },
          {
            match_string = 'o',
            text = '',
            hl = 'MarkviewCheckboxCancelled',
          },
          {
            match_string = '?',
            text = '󰋗',
            hl = 'MarkviewCheckboxPending',
          },
          {
            match_string = '!',
            text = '󰀦',
            hl = 'MarkviewCheckboxUnchecked',
          },
          {
            match_string = '*',
            text = '󰓎',
            hl = 'MarkviewCheckboxPending',
          },
          {
            match_string = '"',
            text = '󰸥',
            hl = 'MarkviewCheckboxCancelled',
          },
          {
            match_string = 'l',
            text = '󰆋',
            hl = 'MarkviewCheckboxProgress',
          },
          {
            match_string = 'b',
            text = '󰃀',
            hl = 'MarkviewCheckboxProgress',
          },
          {
            match_string = 'i',
            text = '󰰄',
            hl = 'MarkviewCheckboxChecked',
          },
          {
            match_string = 'S',
            text = '',
            hl = 'MarkviewCheckboxChecked',
          },
          {
            match_string = 'I',
            text = '󰛨',
            hl = 'MarkviewCheckboxPending',
          },
          {
            match_string = 'p',
            text = '',
            hl = 'MarkviewCheckboxChecked',
          },
          {
            match_string = 'c',
            text = '',
            hl = 'MarkviewCheckboxUnchecked',
          },
          {
            match_string = 'f',
            text = '󱠇',
            hl = 'MarkviewCheckboxUnchecked',
          },
          {
            match_string = 'k',
            text = '',
            hl = 'MarkviewCheckboxPending',
          },
          {
            match_string = 'w',
            text = '',
            hl = 'MarkviewCheckboxProgress',
          },
          {
            match_string = 'u',
            text = '󰔵',
            hl = 'MarkviewCheckboxChecked',
          },
          {
            match_string = 'd',
            text = '󰔳',
            hl = 'MarkviewCheckboxUnchecked',
          },
        },
      },
    }
  end,
}
