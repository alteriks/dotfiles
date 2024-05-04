return {
  {
    'jvgrootveld/telescope-zoxide',
    event = 'VeryLazy',
    dependencies = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    opts = {
      extensions = {
        zoxide = {
          prompt_title = '[ Zoxide Jump ]',
          mappings = {
            -- INFO: Great success!
            ['<C-l>'] = {
              keepinsert = true,
              action = function(selection)
                require('telescope.builtin').find_files { cwd = selection.path }
              end,
            },
          },
        },
      },
    },
  },
}
