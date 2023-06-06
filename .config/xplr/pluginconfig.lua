-- dragon-drop (GTK3) vs blobdrop-git (QT6)
require("dragon").setup({
	-- mode = "selection_ops",
	mode = "default",
	key = "D",
	drag_args = "--and-exit --all",
	drop_args = "",
	keep_selection = false,
	bin = "dragon-drop",
})

require("dual-pane").setup({
	active_pane_width = { Percentage = 70 },
	inactive_pane_width = { Percentage = 30 },
})

require("nuke").setup({
	pager = "less -R",
	open = {
		run_executables = false, -- default: false
		custom = {
			-- {mime = "video/mp4", command = "mpv {}"},
			-- {mime = "application/pdf", command = "swallow zathura {}"},
			{ mime = "application/pdf", command = "~/.config/i3/bin/i3-tabbed.py zathura {}" },
			{ mime_regex = "^application/epub.*", command = "~/.config/i3/bin/i3-tabbed.py zathura {}" },
			{ mime_regex = "^audio/.*", command = "mpv {} -wid $(xdotool getactivewindow)" },
			{ mime_regex = "^text/.*", command = "nvim {}" },
			-- {mime_regex = "^image/.*", command = "mpv --image-display-duration=inf $(fd --maxdepth=1|rg --fixed-strings --after-context=999 {}) -wid $(xdotool getactivewindow); sleep 10"},
			-- {mime_regex = "^image/.*", command = "export FILE=$(basename $XPLR_FOCUS_PATH); mpv --input-conf=~/.config/mpv/input_images.conf --no-config --no-terminal --image-display-duration=inf $(fd --maxdepth=1 | grep $FILE --after-context=999) -wid $(xdotool getactivewindow)"},
			{
				-- Wayland doesn't support xdotool, so it's best to use tabbed
				mime_regex = "^image/.*",
				-- command = 'export FILE=$(basename "$XPLR_FOCUS_PATH"); ~/.config/i3/bin/i3-tabbed.py mpv --input-conf=~/.config/mpv/input_images.conf --no-config --no-terminal --image-display-duration=inf $(fd --maxdepth=1 | grep "$FILE" --after-context=999)',
				command = '~/.config/i3/bin/i3-tabbed.py mpv --config-dir=$HOME/.config/mvi/ --no-terminal {}',
			},
			-- {
			-- 	mime_regex = "^image/.*",
			-- 	command = "chafa --center on --duration 0.1 {}; bash -c \"read -r -p 'Press any button...' -n 1 -s\"",
			-- },
			{ mime_regex = "^video/.*", command = "mpv {} -wid $(xdotool getactivewindow)" },
			-- {mime_regex = "^image/.*", command = "chafa  {}; sleep 2"},
			-- {extension = "jpg", command = "chafa {}"},

			-- {extension = "txt", command = "bat -p {}"},
			--#ERROR:? {mime = "text/plain", command = "bat -p {}"},

			{ mime_regex = ".*", command = "xdg-open {}" },
		},
	},
	view = {
		show_line_numbers = true, -- default: false
		custom = {},
	},
	smart_view = {
		custom = {
			{ extension = "so", command = "ldd -r {} | less" },
			{ extension = "md", command = "glow -p {}" },
		},
	},
})

require("trash-cli").setup({
	trash_bin = "trash-put",
	trash_mode = "delete",
	trash_key = "d",
	restore_bin = "trash-restore",
	restore_mode = "delete",
	restore_key = "r",
	trash_list_bin = "trash-list",
	trash_list_selector = "fzf -m | cut -d' ' -f3-",
})

require("tri-pane").setup({
	layout_key = "t", -- In switch_layout mode
	as_default_layout = false,
	left_pane_width = { Percentage = 20 },
	middle_pane_width = { Percentage = 50 },
	right_pane_width = { Percentage = 30 },
	left_pane_renderer = custom_function_to_render_left_pane,
	right_pane_renderer = custom_function_to_render_right_pane,
})

require("qrcp").setup({
	mode = "default",
	key = "Q",
	send_options = "-i lan",
	receive_options = "-i lan",
})

require("zoxide").setup({
	mode = "default",
	key = "z",
})
