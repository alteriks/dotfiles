require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!
-- TODO: verify o.commentstring
o.commentstring = "# %s" -- default if filetype is not set and Comment.nvim cannot use computed LSP ts_context_commentstring

-- let g:suda_smart_edit = 1
vim.g.suda_smart_edit = 1

-- TODO: spell checking
-- o.spelllang = { "pl", "en" }

-- Highlights yanks
-- replaces machakann/vim-highlightedyank
-- vim.cmd [[ autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup=(vim.fn['hlexists']('HighlightedyankRegion') > 0 and 'HighlightedyankRegion' or 'IncSearch'), timeout=150}]]
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank({higroup=(vim.fn['hlexists']('HighlightedyankRegion') > 0 and 'HighlightedyankRegion' or 'IncSearch'), timeout=150})
  end,
})

-- farmergreg/vim-lastplace replacement
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  desc = "return cursor to where it was last time closing the file",
  pattern = "*",
  command = 'silent! normal! g`"zv',
})
