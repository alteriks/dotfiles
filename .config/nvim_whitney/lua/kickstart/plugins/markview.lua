return {

  'OXY2DEV/markview.nvim',
  lazy = false, -- Recommended
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
      ignore_nodes = { 'fenced_code_block', 'atx_heading', 'block_quote' },
      headings = presets.headings.arrowed,
      checkboxes = presets.checkboxes.nerd,
    }
  end,
}
