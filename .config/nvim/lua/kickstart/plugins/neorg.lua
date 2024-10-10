return {
  {
    'nvim-neorg/neorg',
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = '*', -- Pin Neorg to the latest stable release
    config = true,
  },
  -- {
  --   'lukas-reineke/headlines.nvim',
  --   dependencies = 'nvim-treesitter/nvim-treesitter',
  --   config = true,
  --   -- commit = 'e3d7bfdf40e41a020d966d35f8b48d75b90367d2',
  --   --   opts = {
  --   --     bullets = { '◉', '○', '✸', '✿' },
  --   --   },
  -- },
}
