--[[
  Just run this script along with your other scripts if you wish for LevelSpell to work.
  This only works if you are VIP unfortunately.
]]
if not VIP_USER then return end
print("LevelSpell override is active")

_G.LevelSpell = function(id)
	local offsets = {[_Q] = 0x70, [_W] = 0xB0, [_E] = 0xF0, [_R] = 0x30,}
	local p = CLoLPacket(0x0023)
	p.vTable = 0xE23A7C
	p:EncodeF(myHero.networkID)
	p:Encode4(0xBEBEBEBE)
	p:Encode4(0x16161616)
	p:Encode1(0x6B)
	p:Encode4(0x7C7C7C7C)
	p:Encode1(offsets[id])
	p:Encode4(0x00000000)
	p:Encode1(0x00)
	SendPacket(p)
end

--[[Updated for 5.11 - 2015-06-10]]
