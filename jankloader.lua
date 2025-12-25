local jankloader = {
	currentMap = "",
	mapInfo = {
		w1 = {},
		w2 = {},
		w3 = {},
		w4 = {},
		w5 = {},
		w6 = {},
		w7 = {},
		w8 = {},
		w9 = {},
		w10 = {},
		et = {}
	}
}

function jankloader.getNextMap()
	local file = io.open(jankloader.currentMap, "r")
	local file2 = file:read()
	local nextMap = file2:match("√([^%[%]]+)%[") -- Removes everything except for the next map name
	file:close()
	return nextMap
end

function jankloader.loadMap()
	local file = io.open(jankloader.currentMap, "r")
	local file2 = file:read()
	jankloader.mapInfo.et.x = file2:match("√[^%[]*%[([^,]+)") -- et is for End trigger.
	jankloader.mapInfo.et.y = file2:match("√[^%[]*%[[^,]+,([^%]]+)%]█") -- Format is: √mapFile[x,y]█
	
end

return jankloader
