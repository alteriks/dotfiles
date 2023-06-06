if vim.fn.executable("cb") == 0 then
  print("clipboard not found, clipboard integration won't work")
else
  vim.g.clipboard = {
    name = "clipboard (wsl)",
    copy = {
      ["+"] = "cb copy",
      ["*"] = "cb copy",
    },
    paste = {
      ["+"] = function()
        return vim.fn.systemlist("cb paste", { "" }, 1) -- '1' keeps empty lines
      end,
      ["*"] = function()
        return vim.fn.systemlist("cb paste", { "" }, 1)
      end,
    },
    cache_enabled = true,
  }
end
