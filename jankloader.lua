_G.jankloader = {
	currentMap = ".\\maps\\00.jma",
	mapInfo = {
		walls = {
		
		}
		et = {}
	}
}

function jankloader.getNextMap()
	local file = io.open(jankloader.currentMap, "r")
	local file2 = file:read()
	local nextMap = file2:match("b([^%[%]]+)%[") -- Removes everything except for the next map name
	file:close()
	return nextMap
end

function jankloader.loadMap()
	local file = io.open(jankloader.currentMap, "r")
	local file2 = file:read()
	-- print(file2)
	jankloader.mapInfo.et.x = file2:match("b[^%[]*%[([^,]+)")
	jankloader.mapInfo.et.y = file2:match("b[^%[]*%[[^,]+,([^%]]+)%]")
	for wc = 1, 20 do
		local val = string.char(wc+33)
		-- this is less jank:tm:y and will break any map files made before this
		if file2:match("%".. val .."(.-) .- .- .- .-") == nil then
		else
			jankloader.mapInfo.walls[wc].t = file2:match("%".. val .."(.-) .- .- .- .-")
			jankloader.mapInfo.walls[wc].b = file2:match("%".. val ..".- (.-) .- .- .-")
			jankloader.mapInfo.walls[wc].l = file2:match("%".. val ..".- .- (.-) .- .-")
			jankloader.mapInfo.walls[wc].r = file2:match("%".. val ..".- .- .- (.-) .-")
			jankloader.mapInfo.walls[wc].s = file2:match("%".. val ..".- .- .- .- (.-)")
		end
	end
	file:close()
end

return jankloader
