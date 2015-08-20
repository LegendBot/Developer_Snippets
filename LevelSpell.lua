--[[
  Just run this script along with your other scripts if you wish for LevelSpell to work.
  This only works if you are VIP unfortunately.
]]
if not VIP_USER then _G.LevelSpell = function() end return end
print("LevelSpell override is active")

_G.LevelSpell = function(id)
	local offsets = {
		[_Q] = 0x07,
		[_W] = 0x0B,
		[_E] = 0x03,
		[_R] = 0x0C,
	}
	local p = CLoLPacket(0x00A9)
	p.vTable = 0xFB572C
	p:EncodeF(myHero.networkID)
	for i = 1, 4 do	p:Encode1(0x04)	end
	for i = 1, 4 do	p:Encode1(0xBD)	end
	p:Encode1(offsets[id])
	for i = 1, 4 do	p:Encode1(0x89)	end
	p:Encode1(0x1C)
	p:Encode1(0x28)
	p:Encode1(0xEC)
	p:Encode1(0x1B)
	p:Encode1(0x00)
	SendPacket(p)
end
--[[Updated for 5.16 - 2015-08-20]]
