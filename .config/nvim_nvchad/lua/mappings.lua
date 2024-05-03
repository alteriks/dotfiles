require "nvchad.mappings"
local map = vim.keymap.set

-- save file when in INSERT/VISUAL/NORMAL/SELECT
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Move Lines with Alt in NORMAL/INSERT/VISUAL
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })
-- Move Lines with Shift
map("v", "J", ":m '>+1<CR>gv==kgvo<esc>=kgvo", { desc = "move highlighted text down" })
map("v", "K", ":m '<-2<CR>gv==jgvo<esc>=jgvo", { desc = "move highlighted text up" })

-- thx primeagen
map("n", "J", "mzJ`z", { desc = "Join lines, but cursor stays where it was" })
map("n", "<C-d>", "<C-d>zz", { desc = "Down Half Page" })
map("n", "<C-u>", "<C-u>zz", { desc = "Up Half Page" })
map("n", "<leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "substituted hovered word" }) -- INFO: learn
-- quick home/end in NORMAL
map("n", "H", "^", { desc = "Go to begginin of the line" })
map("n", "L", "$", { desc = "Go to the end of the line" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
-- The direction of n and N depends on whether / or ? was used for searching forward or backward respectively.
-- If you want n to always search forward and N backward, use this:
map("n", "n", "'Nn'[v:searchforward].'zzzv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zzzv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- lazy
map("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" }) -- TODO: change mapping

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- undo tree
map("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Undo Tree" })

--gitsigns
map("n", "]h", ":Gitsigns next_hunk<CR>", { desc = "Next Hunk" })
map("n", "[h", ":Gitsigns prev_hunk<CR>", { desc = "Prev Hunk" })
map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", { desc = "Stage Hunk" })
map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", { desc = "Reset Hunk" })
map("n", "<leader>ghS", ":Gitsigns stage_buffer<CR>", { desc = "Stage Buffer" })
map("n", "<leader>ghu", ":Gitsigns undo_stage_hunk<CR>", { desc = "Undo Stage Hunk" })
map("n", "<leader>ghR", ":Gitsigns reset_buffer<CR>", { desc = "Reset Buffer" })
map("n", "<leader>ghp", ":Gitsigns preview_hunk_inline<CR>", { desc = "Preview Hunk Inline" })
map("n", "<leader>ghb", ":Gitsigns blame_line<CR>", { desc = "Blame Line" })
map("n", "<leader>ghd", ":Gitsigns diffthis<CR>", { desc = "Diff This" })
map("n", "<leader>ghD", ":Gitsigns diffthis ~<CR>", { desc = "Diff This ~" })
map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "GitSigns Select Hunk" })

-- splits
map("n", "<Leader>\\", ":vsplit<CR>", { desc = "which_key_ignore"}) -- Vertical split
map("n", "<Leader>|", ":botright vsplit<CR>", { desc = "which_key_ignore" }) -- Bottom split
map("n", "<Leader>-", ":split<CR>", { desc = "which_key_ignore" }) --Horizontal split
map("n", "<Leader>_", ":botright split<CR>", { desc = "which_key_ignore" }) --Right split

map("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })

-- telescope dependent plugins
map("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "telescope Todo" })
map("n", "<leader>fZ", require("telescope").extensions.zoxide.list, { desc = "zoxide jump" }) -- INFO: learn

-- nvimtree
-- TODO:disable <leader>e, it's easier to change window using <C-j>
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Nvimtree Toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "Nvimtree Focus window" })

-- selfexplanatory
map("n", "<c-z>", "", { desc = "Disable suspend with Ctrl+z" })
map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<Leader>o", "o<ESC>", { desc = "Insert newline above and return to NORMAL" })
map("n", "<Leader>O", "O<ESC>", { desc = "Insert newline below and return to NORMAL" })
map("i", "<C-BS>", "<Esc>cvb", { desc = "Delete entire word" })

-- global lsp mappings
vim.keymap.del("n", "<leader>lf")
vim.keymap.del("n", "<leader>q")
map("n", "<leader>lf", vim.diagnostic.open_float, { desc = "lsp floating diagnostics" })
map("n", "<leader>lq", vim.diagnostic.setloclist, { desc = "lsp diagnostic loclist" })
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go { severity = severity }
  end
end
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" }) -- INFO: learn
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" }) -- INFO: learn
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })
