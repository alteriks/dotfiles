-- The builtin action mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.action.key_bindings.on_key["!"].messages = {
	{ Call = { command = "zsh", args = { "-i" } } },
	"ExplorePwdAsync",
	"PopMode",
}
xplr.config.modes.builtin.action.key_bindings.on_key["#"] = {
	help = "print config and quit",
	messages = {
		"PrintAppStateAndQuit",
	},
}

-- Disable fullscreen HelpMenu
xplr.config.modes.builtin.action.layout = nil
xplr.config.modes.builtin.delete.layout = nil
xplr.config.modes.builtin.selection_ops.layout = nil
xplr.config.modes.builtin.switch_layout.layout = nil
xplr.config.modes.builtin.create.layout = nil

-- The builtin go to path mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.go_to = {
	name = "go to",
	-- layout = "HelpMenu",
	key_bindings = {
		on_key = {
			["f"] = {
				help = "follow symlink",
				messages = {
					"FollowSymlink",
					"PopMode",
				},
			},
			["g"] = {
				help = "top",
				messages = {
					"FocusFirst",
					"PopMode",
				},
			},
			["h"] = {
				help = "go home",
				messages = {
					{
						BashExecSilently0 = [===[
              "$XPLR" -m 'ChangeDirectory: %q' "${HOME:?}"
            ]===],
					},
					"PopMode",
				},
			},
			["p"] = {
				help = "path",
				messages = {
					"PopMode",
					{ SwitchModeBuiltin = "go_to_path" },
					{ SetInputBuffer = "" },
				},
			},
			["i"] = {
				help = "initial $PWD",
				messages = {
					"PopMode",
					{
						BashExecSilently0 = [===[
              "$XPLR" -m 'ChangeDirectory: %q' "${XPLR_INITIAL_PWD:?}"
            ]===],
					},
				},
			},
			["x"] = {
				help = "open in gui",
				messages = {
					{
						BashExecSilently0 = [===[
              if [ -z "$OPENER" ]; then
                if command -v xdg-open; then
                  OPENER=xdg-open
                elif command -v open; then
                  OPENER=open
                else
                  "$XPLR" -m 'LogError: %q' "$OPENER not found"
                  exit 1
                fi
              fi
              (while IFS= read -r -d '' PTH; do
                $OPENER "${PTH:?}" > /dev/null 2>&1
              done < "${XPLR_PIPE_RESULT_OUT:?}")
            ]===],
					},
					"ClearScreen",
					"PopMode",
				},
			},
		},
	},
}

--
-- Redefine [Keybinding](https://xplr.dev/en/configure-key-bindings)
-- Default https://github.com/sayanarijit/xplr/blob/dev/src/init.lua
-- Don't show help, key bindings and messages(actions) have to be defined
--

local key = xplr.config.modes.builtin.default.key_bindings.on_key
key.space = {
	-- help = "toggle selection",
	messages = {
		"ToggleSelection",
		"FocusNext",
	},
}
key["page-up"] = {
	-- help = "scroll up",
	messages = {
		"ScrollUp",
	},
}
key["page-down"] = {
	-- help = "scroll down",
	messages = {
		"ScrollDown",
	},
}
key["{"] = {
	-- help = "scroll up half",
	messages = {
		"ScrollUpHalf",
	},
}
key["}"] = {
	-- help = "scroll down half",
	messages = {
		"ScrollDownHalf",
	},
}
key["~"] = {
	-- help = "go home",
	messages = {
		{
			BashExecSilently0 = [===[
      "$XPLR" -m 'ChangeDirectory: %q' "${HOME:?}"
      ]===],
		},
	},
}
key.q = {
	-- help = "quit",
	messages = {
		"Quit",
	},
}
key["ctrl-d"] = {
	messages = {
		"ScrollDownHalf",
	},
}
key["ctrl-r"] = {
	-- help = "refresh screen",
	messages = {
		"ClearScreen",
		"ExplorePwd", -- also rescan dir
	},
}
key["ctrl-u"] = {
	messages = {
		"ScrollUpHalf",
	},
}
--
--
--
key.v = {
	-- help = "nuke",
	messages = { "PopMode", { SwitchModeCustom = "nuke" } },
}
-- key["f3"] = xplr.config.modes.custom.nuke.key_bindings.on_key.v
-- key.right = xplr.config.modes.custom.nuke.key_bindings.on_key.v
-- key.l = xplr.config.modes.custom.nuke.key_bindings.on_key.v
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
key.X = {
	help = " open in GUI",
	messages = {
		{
			BashExecSilently = [===[
      xdg-open "${XPLR_FOCUS_PATH:?}"
      ]===],
		},
	},
}
key["enter"] = xplr.config.modes.custom.nuke.key_bindings.on_key.o
