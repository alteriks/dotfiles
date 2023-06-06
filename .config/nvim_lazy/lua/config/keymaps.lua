-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.keymap.set("i", "<C-BS>", "<Esc>cvb", { desc = "Delete entire word" })
-- vim.keymap.set("n", "<cr>", "ciw", { desc = "Change inner word using <CR>" })
vim.keymap.set(
  "n",
  "<leader>;",
  "<cmd>lua require('telescope.builtin').resume(require('telescope.themes').get_ivy({}))<cr>",
  { desc = "Resume telescope last search" }
)
vim.keymap.set("n", "H", "^", { desc = "Go to beggining of the line" })
vim.keymap.set("n", "L", "$", { desc = "Go to the end of the line" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv==kgvo<esc>=kgvo", { desc = "move highlighted text down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv==jgvo<esc>=jgvo", { desc = "move highlighted text up" })

-- vim.keymap.set("n", "<Left>", "<cmd>:bprevious<cr>")
-- vim.keymap.set("n", "<Right>", "<cmd>:bnext<cr>")

vim.keymap.set("n", "<Leader>o", "o<ESC>", { desc = "Insert newline above and return to NORMAL" })
vim.keymap.set("n", "<Leader>O", "O<ESC>", { desc = "Insert newline below and return to NORMAL" })

vim.keymap.set("n", "<Leader>\\", ":vsplit<CR>", { desc = "" })
vim.keymap.set("n", "<Leader>|", ":botright vsplit<CR>", { desc = "" })
vim.keymap.set("n", "<Leader>-", ":split<CR>", { desc = "" })
vim.keymap.set("n", "<Leader>_", ":botright split<CR>", { desc = "" })

vim.keymap.set("n", "<c-z>", "", { desc = "Disable suspend with Ctrl+z" })

vim.keymap.set({ "n", "x", "o" }, "x", "<Plug>(leap-forward-till)")
vim.keymap.set({ "n", "x", "o" }, "X", "<Plug>(leap-backward-till)")

-- HOP
-- local hop = require("hop")
-- local directions = require("hop.hint").HintDirection
-- vim.keymap.set("", "f", function()
--   hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
-- end, { remap = true })
--
-- vim.keymap.set("", "F", function()
--   hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
-- end, { remap = true })
--
-- vim.keymap.set("", "t", function()
--   hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
-- end, { remap = true })
--
-- vim.keymap.set("", "T", function()
--   hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
-- end, { remap = true })
--
vim.keymap.set("n", "<leader>c", require("osc52").copy_operator, { expr = true })
vim.keymap.set("n", "<leader>cc", "<leader>c_", { remap = true })
vim.keymap.set("v", "<leader>c", require("osc52").copy_visual)
