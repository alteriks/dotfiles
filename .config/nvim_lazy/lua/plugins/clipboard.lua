if vim.fn.executable("cb") == 0 then
  print("cb not found, clipboard integration won't work")
else
  print("cb found, clipboard integration OK")
  vim.g.clipboard = {
    name = "cb (Slackadays/Clipboard)",
    copy = {
      ["+"] = "cb copy 0",
      ["*"] = "cb copy 0",
    },
    paste = {
      ["+"] = function()
        return vim.fn.systemlist("cb paste 0", { "" }, 1) -- '1' keeps empty lines
      end,
      ["*"] = function()
        return vim.fn.systemlist("cb paste 0", { "" }, 1)
      end,
    },
    cache_enabled = true,
  }
end
