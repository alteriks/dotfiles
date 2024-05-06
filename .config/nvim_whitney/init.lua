--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
-- vim.g.have_nerd_font = true

-- [[ Setting options ]]
require 'options'

-- [[ Install `lazy.nvim` plugin manager ]]
-- [[ Also configure and install plugins ]]
require 'lazy-bootstrap'

-- [[ Basic Keymaps ]]
-- Many plugins have their own way of configuring key mappings
require 'keymaps'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
