version = "0.20.0"

local home = os.getenv("HOME")
local xpm_path = home .. "/.local/share/xplr/dtomvan/xpm.xplr"
local xplr_config = home .. "/.config/xplr"
local xpm_url = "https://github.com/dtomvan/xpm.xplr"

package.path = package.path
  .. ";"
  .. xplr_config
  .. "/?.lua;"
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

    'alteriks/trash-cli.xplr',
    'Junker/nuke.xplr',
    'sayanarijit/dragon.xplr',
    'sayanarijit/dual-pane.xplr',
    'sayanarijit/dua-cli.xplr',
    'sayanarijit/fzf.xplr',
    'sayanarijit/icons.xplr',
    'sayanarijit/map.xplr',
    'sayanarijit/tri-pane.xplr',
    'sayanarijit/qrcp.xplr',
    'sayanarijit/zoxide.xplr',
  },
  auto_install = true,
  auto_cleanup = true,
})

require("pluginconfig")
require("theme")
require("layout")
require("bookmark")
require("keybind")

xplr.config.general.enable_mouse = true

xplr.config.general.initial_sorting = {
    { sorter = "ByCanonicalIsDir", reverse = true },
    { sorter = "ByLastModified", reverse = true },
    -- { sorter = "ByIRelativePath", reverse = false },
}
