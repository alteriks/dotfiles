-- https://github.com/mfussenegger/nvim-lint
-- analyzes source code for errors, vulnerabilities, and stylistic issues to improve code quality.
-- local options = {
--   linters_by_ft = {
--     markdown = {'vale',},
--     ansible = {'ansible_lint'},
--   },
-- }

-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--   callback = function()
--
--     -- try_lint without arguments runs the linters defined in `linters_by_ft`
--     -- for the current filetype
--     require("lint").try_lint()
--
--     -- You can call `try_lint` with a linter name or a list of names to always
--     -- run specific linters, independent of the `linters_by_ft` configuration
--     require("lint").try_lint("cspell")
--   end,
-- })

require("lint").linters_by_ft = {
  ansible = { "ansible_lint" },
  ["yaml.ansible"] = { "ansible_lint" },
  javascript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  -- markdown = {'vale',},
  typescript = { "eslint_d" },
  typescriptreact = { "eslint_d" },
}

require("lint").linters.ansible_lint = {
  cmd = "/usr/bin/ansible-lint",
  args = { "-p", "--nocolor", "-c", "/home/alteriks/.config/ansible-lint/ansible-lint.yml" },
  ignore_exitcode = true,
  parser = require("lint.parser").from_errorformat("%f:%l: %m", {
    source = "ansible-lint",
    severity = vim.diagnostic.severity.INFO,
  }),
}

vim.keymap.set("n", "<leader>Ll", function()
  require("lint").try_lint()
end, { desc = "Trigger linting for current file" })

vim.api.nvim_create_autocmd(
  { "BufReadPost", "FileReadPost", "BufWinEnter", "BufWritePost", "TextChanged", "TextChangedI" },
  {
    callback = function()
      require("lint").try_lint()
    end,
  }
)
