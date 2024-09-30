function Linemode:size_and_mtime()
	local year = os.date("%Y")
	local time = (self._file.cha.modified or 0) // 1

	if time > 0 and os.date("%Y", time) == year then
		time = os.date("%b %d %H:%M", time)
	else
		time = time and os.date("%b %d  %Y", time) or ""
	end

	local size = self._file:size()
	return ui.Line(string.format(" %s %s ", size and ya.readable_size(size) or "-", time))
end

local bookmarks = {}

require("yamb"):setup({
	-- Optional, the path ending with path seperator represents folder.
	bookmarks = bookmarks,
	-- Optional, the cli of fzf.
	cli = "fzf",
	-- Optional, a string used for randomly generating keys, where the preceding characters have higher priority.
	keys = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
	-- Optional, the path of bookmarks
	path = (os.getenv("HOME") .. "/.config/zsh/bookmarks_yazi"),
})
-- function Manager:render(area)
-- 	local chunks = self:layout(area)
--
-- 	local bar = function(c, x, y)
-- 		x, y = math.max(0, x), math.max(0, y)
-- 		return ui.Bar(ui.Rect({ x = x, y = y, w = ya.clamp(0, area.w - x, 1), h = math.min(1, area.h) }), ui.Bar.TOP)
-- 			:symbol(c)
-- 	end
--
-- 	return ya.flat({
-- 		-- Borders
-- 		ui.Border(area, ui.Border.ALL):type(ui.Border.ROUNDED),
-- 		ui.Bar(chunks[1], ui.Bar.RIGHT),
-- 		ui.Bar(chunks[3], ui.Bar.LEFT),
--
-- 		bar("┬", chunks[1].right - 1, chunks[1].y),
-- 		bar("┴", chunks[1].right - 1, chunks[1].bottom - 1),
-- 		bar("┬", chunks[2].right, chunks[2].y),
-- 		bar("┴", chunks[2].right, chunks[1].bottom - 1),
--
-- 		-- Parent
-- 		Parent:render(chunks[1]:padding(ui.Padding.xy(1))),
-- 		-- Current
-- 		Current:render(chunks[2]:padding(ui.Padding.y(1))),
-- 		-- Preview
-- 		Preview:render(chunks[3]:padding(ui.Padding.xy(1))),
-- 	})
-- end
