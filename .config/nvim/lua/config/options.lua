-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
local opt = vim.opt

opt.spelllang = { "pl", "en" }
opt.wrap = true

-- If echasnovski/mini.comment can't use computed LSP ts_context_commentstring then use this:
opt.commentstring = "# %s"

local lazy_core = require("lazy.core.config").options
lazy_core.lockfile = vim.fn.stdpath("config") .. "/lazy-lock_" .. vim.fn.hostname() .. ".json"
--
-- vim.g.clipboard = {
--   name = "OSC 52",
--   copy = {
--     ["+"] = require("vim.clipboard.osc52").copy,
--     ["*"] = require("vim.clipboard.osc52").copy,
--   },
--   paste = {
--     ["+"] = require("vim.clipboard.osc52").paste,
--     ["*"] = require("vim.clipboard.osc52").paste,
--   },
-- }
