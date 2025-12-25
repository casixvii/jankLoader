local jankloader = {
	currentMap = ".\\maps\\00.jma",
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
	jankloader.mapInfo.et.x = file2:match("√[^%[]*%[([^,]+)")
	jankloader.mapInfo.et.y = file2:match("√[^%[]*%[[^,]+,([^%]]+)%]█")
	-- this is some of the jank™ iest pieces of code ever
	jankloader.mapInfo.w1.tl = file2:match("█%[(.-),.-,.-,.-,.-%]ⁿ")
	jankloader.mapInfo.w1.tr = file2:match("█%[.-,(.-),.-,.-,.-%]ⁿ")
	jankloader.mapInfo.w1.bl = file2:match("█%[.-,.-,(.-),.-,.-%]ⁿ")
	jankloader.mapInfo.w1.br = file2:match("█%[.-,.-,.-,(.-),.-%]ⁿ")
	jankloader.mapInfo.w1.s = file2:match("█%[.-,.-,.-,.-,(.-)%]ⁿ")
	jankloader.mapInfo.w2.tl = file2:match("ⁿ%[(.-),.-,.-,.-,.-%]▐")
	jankloader.mapInfo.w2.tr = file2:match("ⁿ%[.-,(.-),.-,.-,.-%]▐")
	jankloader.mapInfo.w2.bl = file2:match("ⁿ%[.-,.-,(.-),.-,.-%]▐")
	jankloader.mapInfo.w2.br = file2:match("ⁿ%[.-,.-,.-,(.-),.-%]▐")
	jankloader.mapInfo.w2.s = file2:match("ⁿ%[.-,.-,.-,.-,(.-)%]▐")
	jankloader.mapInfo.w3.tl = file2:match("▐%[(.-),.-,.-,.-,.-%]∞")
	jankloader.mapInfo.w3.tr = file2:match("▐%[.-,(.-),.-,.-,.-%]∞")
	jankloader.mapInfo.w3.bl = file2:match("▐%[.-,.-,(.-),.-,.-%]∞")
	jankloader.mapInfo.w3.br = file2:match("▐%[.-,.-,.-,(.-),.-%]∞")
	jankloader.mapInfo.w3.s = file2:match("▐%[.-,.-,.-,.-,(.-)%]∞")
	jankloader.mapInfo.w4.tl = file2:match("∞%[(.-),.-,.-,.-,.-%]≡")
	jankloader.mapInfo.w4.tr = file2:match("∞%[.-,(.-),.-,.-,.-%]≡")
	jankloader.mapInfo.w4.bl = file2:match("∞%[.-,.-,(.-),.-,.-%]≡")
	jankloader.mapInfo.w4.br = file2:match("∞%[.-,.-,.-,(.-),.-%]≡")
	jankloader.mapInfo.w4.s = file2:match("∞%[.-,.-,.-,.-,(.-)%]≡")
	jankloader.mapInfo.w5.tl = file2:match("≡%[(.-),.-,.-,.-,.-%]╠")
	jankloader.mapInfo.w5.tr = file2:match("≡%[.-,(.-),.-,.-,.-%]╠")
	jankloader.mapInfo.w5.bl = file2:match("≡%[.-,.-,(.-),.-,.-%]╠")
	jankloader.mapInfo.w5.br = file2:match("≡%[.-,.-,.-,(.-),.-%]╠")
	jankloader.mapInfo.w5.s = file2:match("≡%[.-,.-,.-,.-,(.-)%]╠")
	jankloader.mapInfo.w6.tl = file2:match("╠%[(.-),.-,.-,.-,.-%]π")
	jankloader.mapInfo.w6.tr = file2:match("╠%[.-,(.-),.-,.-,.-%]π")
	jankloader.mapInfo.w6.bl = file2:match("╠%[.-,.-,(.-),.-,.-%]π")
	jankloader.mapInfo.w6.br = file2:match("╠%[.-,.-,.-,(.-),.-%]π")
	jankloader.mapInfo.w6.s = file2:match("╠%[.-,.-,.-,.-,(.-)%]π")
	jankloader.mapInfo.w7.tl = file2:match("π%[(.-),.-,.-,.-,.-%]≈")
	jankloader.mapInfo.w7.tr = file2:match("π%[.-,(.-),.-,.-,.-%]≈")
	jankloader.mapInfo.w7.bl = file2:match("π%[.-,.-,(.-),.-,.-%]≈")
	jankloader.mapInfo.w7.br = file2:match("π%[.-,.-,.-,(.-),.-%]≈")
	jankloader.mapInfo.w7.s = file2:match("π%[.-,.-,.-,.-,(.-)%]≈")
	jankloader.mapInfo.w8.tl = file2:match("≈%[(.-),.-,.-,.-,.-%]≡")
	jankloader.mapInfo.w8.tr = file2:match("≈%[.-,(.-),.-,.-,.-%]≡")
	jankloader.mapInfo.w8.bl = file2:match("≈%[.-,.-,(.-),.-,.-%]≡")
	jankloader.mapInfo.w8.br = file2:match("≈%[.-,.-,.-,(.-),.-%]≡")
	jankloader.mapInfo.w8.s = file2:match("≈%[.-,.-,.-,.-,(.-)%]≡")
	jankloader.mapInfo.w9.tl = file2:match("≡%[(.-),.-,.-,.-,.-%]╦")
	jankloader.mapInfo.w9.tr = file2:match("≡%[.-,(.-),.-,.-,.-%]╦")
	jankloader.mapInfo.w9.bl = file2:match("≡%[.-,.-,(.-),.-,.-%]╦")
	jankloader.mapInfo.w9.br = file2:match("≡%[.-,.-,.-,(.-),.-%]╦")
	jankloader.mapInfo.w9.s = file2:match("≡%[.-,.-,.-,.-,(.-)%]╦")
	jankloader.mapInfo.w10.tl = file2:match("╦%[(.-),.-,.-,.-,.-%]ú")
	jankloader.mapInfo.w10.tr = file2:match("╦%[.-,(.-),.-,.-,.-%]ú")
	jankloader.mapInfo.w10.bl = file2:match("╦%[.-,.-,(.-),.-,.-%]ú")
	jankloader.mapInfo.w10.br = file2:match("╦%[.-,.-,.-,(.-),.-%]ú")
	jankloader.mapInfo.w10.s = file2:match("╦%[.-,.-,.-,.-,(.-)%]ú")
end

return jankloader
