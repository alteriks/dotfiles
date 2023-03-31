--
-- icons
local function blue(x)
  return "\x1b[34m" .. x .. "\x1b[0m"
end
local function cyan(x)
  return "\x1b[36m" .. x .. "\x1b[0m"
end
xplr.config.node_types.directory.meta.icon = blue "🗁 "
xplr.config.node_types.file.meta.icon = cyan "🗋 "
-- 
xplr.config.node_types.extension.db = { meta = { icon = " " } }
xplr.config.node_types.extension.json = { meta = { icon = " " } }
-- xplr.config.node_types.extension.html = { meta = { icon = " " } }
xplr.config.node_types.extension.md = { meta = { icon = " " } }
xplr.config.node_types.extension.lua = { meta = { icon = " " } }
xplr.config.node_types.extension.png = { meta = { icon = " " } }
xplr.config.node_types.extension.pdf = { meta = { icon = " " }, style = { fg = "Blue" } }
xplr.config.node_types.extension.py = { meta = { icon = " " } }
xplr.config.node_types.extension.rs = { meta = { icon = "🦀" } }

xplr.config.node_types.mime_essence = {
  image = {
    -- image/*
    ["*"] = { meta = { icon = " " } }
  },
}
xplr.config.node_types.mime_essence = {
  text = {
    -- text/*
    ["html"] = { meta = { icon = " " } }
  },
}
xplr.config.node_types.mime_essence = {
  video = {
    -- video/*
    ["*"] = { meta = { icon = " " } }
  },
}
-- ("material-landscape") theme
xplr.config.general.default_ui.prefix = " "
xplr.config.general.default_ui.suffix = ""

xplr.config.general.focus_ui.prefix = "▸"
xplr.config.general.focus_ui.suffix = ""
xplr.config.general.focus_ui.style.fg = { Rgb = { 170, 150, 130} }
xplr.config.general.focus_ui.style.bg = { Rgb = { 50, 50, 50} }
xplr.config.general.focus_ui.style.add_modifiers = { "Bold" }


xplr.config.general.focus_selection_ui.prefix = "▸"
xplr.config.general.focus_selection_ui.suffix = ""
xplr.config.general.focus_selection_ui.style.fg = { Rgb = { 70, 240, 70 } }
xplr.config.general.focus_selection_ui.style.bg = { Rgb = { 50, 50, 50 } }
xplr.config.general.focus_selection_ui.style.add_modifiers = { "Bold" }

xplr.config.general.sort_and_filter_ui.separator.format = " » "
xplr.config.general.sort_and_filter_ui.separator.style.add_modifiers = { "Bold", "Reversed" }

xplr.config.general.panel_ui.default.title.style.bg = { Rgb = {170, 150, 130} }
xplr.config.general.panel_ui.default.title.style.fg = { Rgb = {40, 40, 40} }
xplr.config.general.panel_ui.default.title.style.add_modifiers = { "Bold" }
xplr.config.general.panel_ui.default.style.fg = { Rgb = { 170, 150, 130 } }
xplr.config.general.panel_ui.default.style.bg = { Rgb = { 33, 33, 33 } }
xplr.config.general.panel_ui.default.borders = {}
xplr.config.general.panel_ui.table.style.bg = { Rgb = { 26, 26, 26 } }
-- xplr.config.general.selection_ui.prefix = " » "
xplr.config.general.selection_ui.prefix = "»"
xplr.config.general.selection_ui.suffix = "«"
xplr.config.general.selection_ui.style.fg = { Rgb = { 170, 250, 130 } }
xplr.config.general.selection_ui.style.bg = { Rgb = { 50, 50, 50 } }
xplr.config.general.selection_ui.style.add_modifiers = { "Bold"}
