version = "0.19.0"
-- The default layout without SortAndFilter
--
-- Type: [Layout](https://xplr.dev/en/layout)
xplr.config.layouts.builtin.default = {
  Horizontal = {
    config = {
      constraints = {
        { Percentage = 70 },
        { Percentage = 30 },
      },
    },
    splits = {
      {
        Vertical = {
          config = {
            constraints = {
              { Min = 1 },
              { Length = 3 },
            },
          },
          splits = {
            "Table",
            "InputAndLogs",
          },
        },
      },
      {
        Vertical = {
          config = {
            constraints = {
              { Percentage = 30 },
              { Percentage = 70 },
            },
          },
          splits = {
            "Selection",
            "HelpMenu",
          },
        },
      },
    },
  },
}

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
    -- 'sayanarijit/material-landscape.xplr',
  },
  auto_install = true,
  auto_cleanup = true,
})

require("qrcp").setup{
  mode = "default",
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
  -- Copied from /usr/share/xplr/examples/init.lua, without help = "XXXX"
  key.G = {
    messages = {
      "PopMode",
      "FocusLast",
    },
  }
  key.down = {
    messages = {
      "FocusNext",
    },
  }
  key.j = {
    messages = {
      "FocusNext",
    },
  }
  key.up = {
    messages = {
      "FocusPrevious",
    },
  }
  key.k = {
    messages = {
      "FocusPrevious",
    },
  }
  key.right = {
    messages = {
      "Enter",
    },
  }
  key.l = {
    messages = {
      "Enter",
    },
  }
  key.left = {
    messages = {
      "Back",
    },
  }
  key.h = {
    messages = {
      "Back",
    },
  }

require("zoxide").setup{
  mode = "default",
  key = "z",
}

-- ("material-landscape") theme
xplr.config.general.default_ui.prefix = " "
xplr.config.general.default_ui.suffix = ""

xplr.config.general.focus_ui.prefix = "▸"
xplr.config.general.focus_ui.suffix = ""
xplr.config.general.focus_ui.style.fg = { Rgb = { 170, 150, 130} }
xplr.config.general.focus_ui.style.bg = { Rgb = { 50, 50, 50} }
xplr.config.general.focus_ui.style.add_modifiers = { "Bold" }

xplr.config.general.selection_ui.prefix = " "
xplr.config.general.selection_ui.suffix = ""
xplr.config.general.selection_ui.style.fg = { Rgb = { 70, 70, 70} }
xplr.config.general.selection_ui.style.add_modifiers = { "Bold", "CrossedOut" }

xplr.config.general.focus_selection_ui.prefix = "▸"
xplr.config.general.focus_selection_ui.suffix = ""
xplr.config.general.focus_selection_ui.style.fg = { Rgb = { 170, 150, 130 } }
xplr.config.general.focus_selection_ui.style.bg = { Rgb = { 50, 50, 50 } }
xplr.config.general.focus_selection_ui.style.add_modifiers = { "Bold", "CrossedOut" }

xplr.config.general.sort_and_filter_ui.separator.format = " » "
xplr.config.general.sort_and_filter_ui.separator.style.add_modifiers = { "Bold", "Reversed" }

xplr.config.general.panel_ui.default.title.style.bg = { Rgb = {170, 150, 130} }
xplr.config.general.panel_ui.default.title.style.fg = { Rgb = {40, 40, 40} }
xplr.config.general.panel_ui.default.title.style.add_modifiers = { "Bold" }
xplr.config.general.panel_ui.default.style.fg = { Rgb = { 170, 150, 130 } }
xplr.config.general.panel_ui.default.style.bg = { Rgb = { 33, 33, 33 } }
xplr.config.general.panel_ui.default.borders = {}
xplr.config.general.panel_ui.table.style.bg = { Rgb = { 26, 26, 26 } }

xplr.config.general.enable_mouse = true

xplr.config.modes.builtin.action.key_bindings.on_key["!"].messages = {
  { Call = { command = "zsh", args = { "-i" } } },
  "ExplorePwdAsync",
  "PopMode",
}
