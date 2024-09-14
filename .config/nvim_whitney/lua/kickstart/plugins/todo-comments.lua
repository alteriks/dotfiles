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
      -- Use markdown comments for TODO highlighting `<!-- -->` ie `<!-- TODO: foooo -->`
      -- https://github.com/folke/todo-comments.nvim/issues/150#issuecomment-1306826575
      -- https://github.com/folke/todo-comments.nvim/issues/264
      -- https://github.com/folke/todo-comments.nvim/issues/283
      -- highlight = { comments_only = false },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et{}
