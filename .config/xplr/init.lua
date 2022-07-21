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
    'Junker/nuke.xplr',
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

require("nuke").setup{
  pager = "less -R",
  open = {
    run_executables = false, -- default: false
    custom = {
      {extension = "jpg", command = "sxiv {}"},
      {mime = "video/mp4", command = "vlc {}"},
      {mime_regex = "^video/.*", command = "smplayer {}"},
      {mime_regex = ".*", command = "xdg-open {}"}
    }
  },
  view = {
    show_line_numbers = true, -- default: false
  },
  smart_view = {
    custom = {
      {extension = "so", command = "ldd -r {} | less"},
    }
  }
}

  local key = xplr.config.modes.builtin.default.key_bindings.on_key
  key.v = {
    help = "nuke",
    messages = {"PopMode", {SwitchModeCustom = "nuke"}}
  }
  key["f3"] = xplr.config.modes.custom.nuke.key_bindings.on_key.v
  key["enter"] = xplr.config.modes.custom.nuke.key_bindings.on_key.o
