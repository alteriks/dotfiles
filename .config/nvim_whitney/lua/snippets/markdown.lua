local luasnip = require 'luasnip'
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node

luasnip.add_snippets('markdown', {
  s('trigger2', {
    t { 'After expanding, the cursor is here ->' },
    i(1),
    t { '', 'After jumping forward once, cursor is here ->' },
    i(2),
    t { '', 'After jumping once more, the snippet is exited there ->' },
    i(0),
  }),
  s('temptable', {
    i(1),
    t " <- list(set_iso_lvl = glue::glue('SET TRANSACTION ISOLATION LEVEL READ UNCOMMITED;'), ",
    i(2),
    t ' = glue::glue("',
    i(3),
    t '"),))',
  }),
})
