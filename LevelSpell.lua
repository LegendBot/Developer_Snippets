--[[
  Just run this script along with your other scripts if you wish for LevelSpell to work.
  This only works if you are VIP unfortunately.
]]
if not VIP_USER then _G.LevelSpell = function() end return end
print("LevelSpell override is active")

_G.LevelSpell = function(id)
	local offsets = {
		[_Q] = 0xFB,
		[_W] = 0xEB,
		[_E] = 0xDB,
		[_R] = 0xCB,
	}
	local p = CLoLPacket(0x10A)
	p.vTable = 0xEDD384
	p:EncodeF(myHero.networkID)
	for i = 1, 4 do	p:Encode1(0x13)	end
	p:Encode1(0x9E)
	p:Encode1(offsets[id])
	for i = 1, 4 do	p:Encode1(0x81)	end
	for i = 1, 4 do	p:Encode1(0x57)	end
	for i = 1, 4 do	p:Encode1(0x00)	end
	SendPacket(p)
end
--[[Updated for 5.18 - 2015-09-16]]
