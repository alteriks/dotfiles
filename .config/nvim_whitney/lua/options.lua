-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`
if not vim.env.SSH_TTY then
  -- only set clipboard if not in ssh, to make sure the OSC 52
  -- integration works automatically. Requires Neovim >= 0.10.0
  vim.opt.clipboard = 'unnamedplus' -- Sync with system clipboard
  -- Sync clipboard between OS and Neovim.
  --  Remove this option if you want your OS clipboard to remain independent.
  --  See `:help 'clipboard'`
  -- vim.opt.clipboard = 'unnamedplus'
end

vim.opt.laststatus = 3 -- global statusline

-- Make line numbers default
vim.opt.number = true
-- Add relative line numbers
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Allow virtual editing in Visual block mode - the end is not the end!
vim.opt.virtualedit = 'block'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- let g:suda_smart_edit = 1
vim.g.suda_smart_edit = 1

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300
vim.opt.ttimeoutlen = 50

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
-- INFO: indent-blankline testing
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣', leadmultispace = '  │ ', multispace = '│ ' }

-- Preview substitutions live, as you type!
-- vim.opt.inccommand = 'split'

--Tab length
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

vim.opt.grepprg = 'rg --vimgrep'

-- Set highlight on search
vim.opt.hlsearch = true
-- to enable cursorline!
vim.opt.cursorlineopt = 'both'

vim.opt.commentstring = '# %s' -- default if filetype is not set and Comment.nvim cannot use computed LSP ts_context_commentstring

-- disable nvim intro
vim.opt.shortmess:append 'sI'

-- spell checking on specific filetypes
vim.opt.spelllang = { 'pl', 'en' }
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'html', 'markdown', 'text' },
  callback = function()
    vim.opt_local.spell = true
  end,
})

-- farmergreg/vim-lastplace replacement
vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
  desc = 'return cursor to where it was last time closing the file',
  pattern = '*',
  command = 'silent! normal! g`"zv',
})

-- disable some default providers
vim.g['loaded_node_provider'] = 0
vim.g['loaded_python3_provider'] = 0
vim.g['loaded_perl_provider'] = 0
vim.g['loaded_ruby_provider'] = 0

-- INFO:bottomline is still needed! folke/noice most of the time notifications disappear to fast.
-- But sometimes they linger for too long if there are to many of them.
vim.opt.cmdheight = 1
-- vim: ts=2 sts=2 sw=2 et
