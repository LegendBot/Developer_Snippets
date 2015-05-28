--[[
  Just run this script along with your other scripts if you wish for LevelSpell to work.
  This only works if you are VIP unfortunately.
]]
if not VIP_USER then return end
print("LevelSpell override is active")

_G.LevelSpell = function(id)
	local offsets = {[_Q] = 0xEF, [_W] = 0x99, [_E] = 0xCE, [_R] = 0x5A,}
	local p = CLoLPacket(0x0112)
	p.vTable = 0xE90BCC
	p:EncodeF(myHero.networkID)
	p:Encode4(0x2D2D2D2D)
	p:Encode4(0x23232323)
	p:Encode4(0x4C4C4C4C)
	p:Encode1(0xC8)
	p:Encode1(offsets[id])
	p:Encode4(0x00000000)
	p:Encode1(0x00)
	SendPacket(p)
end

--[[Updated for 5.10 - 2015-05-28]]
