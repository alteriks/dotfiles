-- local ide = {}
-- local image = {}

local ide = {
  require 'kickstart/plugins/conform',
  require 'kickstart/plugins/debug',
  require 'kickstart/plugins/lint',
  require 'kickstart/plugins/lspconfig',
  -- require 'kickstart/plugins/neorg',
}
local image = {
  -- TODO: 3rd/image.nvim not good enough
  -- local image = {
  {
    'vhyrro/luarocks.nvim',
    priority = 1001, -- this plugin needs to run before anything else
    opts = {
      rocks = { 'magick' },
    },
  },
  {
    '3rd/image.nvim',
    dependencies = {
      {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
          require('nvim-treesitter.configs').setup {
            ensure_installed = { 'markdown' },
            highlight = { enable = true },
          }
        end,
      },
    },

    -- event = 'VeryLazy',

    lazy = false,
    -- dependencies = {
    --   'leafo/magick',
    -- },
    -- config = function()
    --   -- ...
    -- end,
    opts = {
      backend = 'kitty',
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { 'markdown', 'vimwiki' }, -- markdown extensions (ie. quarto) can go here
        },
      },
    },
  },
}

-- append ide to image
vim.list_extend(image, ide)

if vim.fn.hostname() == 'carbon' or vim.fn.hostname() == 'moar' then
  if vim.g.neovide then
    -- print 'loading ide'
    return ide
  else
    return image
  end
else
  -- print 'NOT loading ide'
  return {}
end
