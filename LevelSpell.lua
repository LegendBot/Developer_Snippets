--[[
  Just run this script along with your other scripts if you wish for LevelSpell to work.
  This only works if you are VIP unfortunately.
]]
if not VIP_USER then return end
print("LevelSpell override is active")

_G.LevelSpell = function(id)
	local offsets = {
		[_Q] = {0xFF, 0x06},
		[_W] = {0xF7, 0x05},
		[_E] = {0xEF, 0x03},
		[_R] = {0xE7, 0x02},
	}
	local p = CLoLPacket(0x00A2)
	p.vTable = 0xF57E54
	p:EncodeF(myHero.networkID)
	p:Encode4(0x8D8D8D8D)
	p:Encode1(offsets[id][1])
	p:Encode4(0x6F6F6F6F)
	p:Encode1(0x08)
	p:Encode4(0xB1B1B1B1)
	p:Encode1(offsets[id][2])
	p:Encode4(0x00000000)
	SendPacket(p)
end

--[[Updated for 5.12 - 2015-06-26]]
