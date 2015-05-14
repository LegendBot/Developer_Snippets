--[[
  Just run this script along with your other scripts if you wish for LevelSpell to work.
  This only works if you are VIP unfortunately.
]]
if not VIP_USER then return end
print("LevelSpell override is active")

_G.LevelSpell = function(id)
	local offsets = {[_Q] = 0x96, [_W] = 0x9E, [_E] = 0xA6, [_R] = 0x8E,}
	local p = CLoLPacket(0x0047)
	p.vTable = 0xE37454
	p:EncodeF(myHero.networkID)
	p:Encode4(0xEBEBEBEB)
	p:Encode1(0x68)
	p:Encode4(0x7C7C7C7C)
	p:Encode1(offsets[id])
	p:Encode4(0xE8E8E8E8)
	p:Encode4(0x00000000)
	p:Encode1(0x00)
	SendPacket(p)
end

--[[Updated for 5.9 - 2015-05-14]]
