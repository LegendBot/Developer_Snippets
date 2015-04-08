--[[
  Just run this script along with your other scripts if you wish for LevelSpell to work.
  This only works if you are VIP unfortunately.
]]
if not VIP_USER then return end
print("LevelSpell override is active")

_G.LevelSpell = function(id)
	local offsets = {[_Q] = 0x66, [_W] = 0x65, [_E] = 0x64, [_R] = 0x63,}
	local p = CLoLPacket(0x0017)
	p.vTable = 0xE90950
	p:EncodeF(myHero.networkID)
	p:Encode4(0xC7C7C7C7)
	p:Encode1(offsets[id])
	p:Encode1(0x02)
	p:Encode4(0xA9A9A9A9)
	p:Encode4(0xD3D3D3D3)
	p:Encode4(0x00000000)
	p:Encode1(0x00)
	SendPacket(p)
end

--[[Updated for 5.7 - 2015-04-08]]
