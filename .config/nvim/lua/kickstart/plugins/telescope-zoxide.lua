-- Config in lua/kickstart/plugins/telescope-zoxide.lua:extensions
return {
  {
    'jvgrootveld/telescope-zoxide',
    event = 'VeryLazy',
    dependencies = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
  },
}
