-- Highlight todo, notes, etc in comments
-- INFO:
-- WARN:
-- TODO:
-- BUG:
-- HACK:
-- PERF:
return {
  {
    'folke/todo-comments.nvim',
    event = 'VeryLazy',
    -- event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      keywords = {
        NOTE = { icon = ' ', color = 'hint', alt = { 'INFO' } },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
