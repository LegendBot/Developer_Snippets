--[[
  Just run this script along with your other scripts if you wish for LevelSpell to work.
  This only works if you are VIP unfortunately.
]]
if not VIP_USER then _G.LevelSpell = function() end return end
print("LevelSpell override is active")

_G.LevelSpell = function(id)
	local offsets = {
		[_Q] = 0x7D,
		[_W] = 0xFD,
		[_E] = 0x8B,
		[_R] = 0x97,
	}
	local p = CLoLPacket(0x0142)
	p.vTable = 0xEBFE44
	p:EncodeF(myHero.networkID)
	p:Encode1(0x2A)
	for i = 1, 4 do	p:Encode1(0x12)	end
	p:Encode1(offsets[id])
	for i = 1, 4 do	p:Encode1(0x5E)	end
	for i = 1, 4 do	p:Encode1(0xBD)	end
	for i = 1, 4 do	p:Encode1(0x00)	end
	SendPacket(p)
end
--[[Updated for 5.17 - 2015-09-04]]
