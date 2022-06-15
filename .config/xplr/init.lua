version = "0.19.0"

local home = os.getenv("HOME")
local xpm_path = home .. "/.local/share/xplr/dtomvan/xpm.xplr"
local xpm_url = "https://github.com/dtomvan/xpm.xplr"

package.path = package.path
  .. ";"
  .. xpm_path
  .. "/?.lua;"
  .. xpm_path
  .. "/?/init.lua"

os.execute(
  string.format(
    "[ -e '%s' ] || git clone '%s' '%s'",
    xpm_path,
    xpm_url,
    xpm_path
  )
)

require("xpm").setup({
  plugins = {
    -- Let xpm manage itself
    'dtomvan/xpm.xplr',

    'sayanarijit/fzf.xplr',
    'sayanarijit/dua-cli.xplr',
    'sayanarijit/icons.xplr',
    'sayanarijit/map.xplr',
    'sayanarijit/qrcp.xplr',
    'sayanarijit/zoxide.xplr',
  },
  auto_install = true,
  auto_cleanup = true,
})

require("qrcp").setup{
  mode = "action",
  key = "Q",
  send_options = "-i lan",
  receive_options = "-i lan",
}
