-- With `export XPLR_BOOKMARK_FILE="$HOME/bookmarks"`
-- Bookmark: mode binding
xplr.config.modes.builtin.default.key_bindings.on_key["b"] = {
	help = "bookmark mode",
	messages = {
		{ SwitchModeCustom = "bookmark" },
	},
}
xplr.config.modes.custom.bookmark = {
	name = "bookmark",
	key_bindings = {
		on_key = {
			b = {
				help = "bookmark dir",
				messages = {
					{
						BashExecSilently0 = [[
              PTH="${XPLR_FOCUS_PATH:?}"
              if [ -d "${PTH}" ]; then
                PTH="${PTH}"
              elif [ -f "${PTH}" ]; then
                PTH=$(dirname "${PTH}")
              fi
              PTH_ESC=$(printf %q "$PTH")
              if echo "${PTH:?}" >> "${XPLR_BOOKMARK_FILE:?}"; then
                "$XPLR" -m 'LogSuccess: %q' "$PTH_ESC added to bookmarks"
              else
                "$XPLR" -m 'LogError: %q' "Failed to bookmark $PTH_ESC"
              fi
            ]],
					},
					"PopMode",
				},
			},
			g = {
				help = "go to bookmark",
				messages = {
					{
						BashExec0 = [===[
              PTH=$(cat "${XPLR_BOOKMARK_FILE:?}" | fzf --no-sort --exact)
              if [ "$PTH" ]; then
                PTH=$(echo $PTH | awk -F ': ' '{print $2}')
                "$XPLR" -m 'ChangeDirectory: %q' "$PTH"
              fi
            ]===],
					},
					"PopMode",
				},
			},
			d = {
				help = "delete bookmark",
				messages = {
					{
						BashExec0 = [[
              PTH=$(cat "${XPLR_BOOKMARK_FILE:?}" | fzf --no-sort --exact)
              sd "$PTH\n" "" "${XPLR_BOOKMARK_FILE:?}"
            ]],
					},
					"PopMode",
				},
			},
			esc = {
				help = "cancel",
				messages = {
					"PopMode",
				},
			},
		},
	},
}
local key = xplr.config.modes.builtin.default.key_bindings.on_key
key["ctrl-g"] = xplr.config.modes.custom.bookmark.key_bindings.on_key.g
