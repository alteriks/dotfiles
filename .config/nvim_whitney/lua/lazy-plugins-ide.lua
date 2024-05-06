if vim.fn.hostname() == 'carbon' or vim.fn.hostname() == 'moar' then
  -- print 'loading ide'
  return {
    require 'kickstart/plugins/conform',
    require 'kickstart/plugins/lint',
    require 'kickstart/plugins/lspconfig',

    {
      'vhyrro/luarocks.nvim',
      priority = 1001, -- this plugin needs to run before anything else
      opts = {
        rocks = { 'magick' },
      },
    },
    {
      '3rd/image.nvim',
      dependencies = { 'luarocks.nvim' },
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
else
  -- print 'NOT loading ide'
  return {}
end
