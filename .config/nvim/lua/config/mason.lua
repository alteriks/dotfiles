require("mason").setup({
  ui = {
    border = "rounded",
  },
})
require('lint').ansible-lint = {
  args = {'-c', '~/.config/ansible-lint/config'},
}
