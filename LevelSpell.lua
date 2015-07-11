--[[
  Just run this script along with your other scripts if you wish for LevelSpell to work.
  This only works if you are VIP unfortunately.
]]
if not VIP_USER then return end
print("LevelSpell override is active")

_G.LevelSpell = function(id)
	local offsets = {
		[_Q] = {0x7D, 0x07},
		[_W] = {0x12, 0x06},
		[_E] = {0x76, 0x05},
		[_R] = {0x9C, 0x04},
	}
	local p = CLoLPacket(0x00A2)
	p.vTable = 0xF72190
	p:EncodeF(myHero.networkID)
	p:Encode1(offsets[id][1])
	p:Encode4(0xA4A4A4A4)
	p:Encode4(0x4C4C4C4C)
	p:Encode1(0xE2)
	p:Encode4(0x48484848)
	p:Encode1(offsets[id][2])
	p:Encode4(0x00000000)
	SendPacket(p)
end

--[[Updated for 5.13 - 2015-07-11]]
