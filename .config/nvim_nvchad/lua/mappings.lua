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

-- quick home/end in NORMAL
map("n", "H", "^", { desc = "Go to begginin of the line" })
map("n", "L", "$", { desc = "Go to the end of the line" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
-- The direction of n and N depends on whether / or ? was used for searching forward or backward respectively.
-- If you want n to always search forward and N backward, use this:
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

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
map("n", "<Leader>\\", ":vsplit<CR>", { desc = "Vertical split" })
map("n", "<Leader>|", ":botright vsplit<CR>", { desc = "Bottom split" })
map("n", "<Leader>-", ":split<CR>", { desc = "Horizontal split" })
map("n", "<Leader>_", ":botright split<CR>", { desc = "Right split" })

map("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })

-- selfexplanatory
map("n", "<c-z>", "", { desc = "Disable suspend with Ctrl+z" })
map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<Leader>o", "o<ESC>", { desc = "Insert newline above and return to NORMAL" })
map("n", "<Leader>O", "O<ESC>", { desc = "Insert newline below and return to NORMAL" })
map("i", "<C-BS>", "<Esc>cvb", { desc = "Delete entire word" })

local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go { severity = severity }
  end
end
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })
