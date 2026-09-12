local function setup()
	ps.sub("cd", function()
		local cwd = cx.active.current.cwd
		if cwd:ends_with("Downloads") or cwd:ends_with("Bangumi") then
			ya.emit("sort", { "mtime", reverse = true, dir_first = false })
		elseif cwd:ends_with("GroupMeeting") then
			ya.emit("sort", { "alphabetical", reverse = true, dir_first = true })
		else
			ya.emit("sort", { "alphabetical", reverse = false, dir_first = true })
		end
	end)
end

return { setup = setup }
