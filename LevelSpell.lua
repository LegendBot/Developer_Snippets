--[[
  Just run this script along with your other scripts if you wish for LevelSpell to work.
  This only works if you are VIP unfortunately.
]]
if not VIP_USER then return end
print("LevelSpell override is active")

_G.LevelSpell = function(id)
	local offsets = {[_Q] = 0x7F, [_W] = 0x5B, [_E] = 0x5F, [_R] = 0x6B}
	local p = CLoLPacket(0x012A)
	p.vTable = 0xE912D0
	p:EncodeF(myHero.networkID)
	p:Encode4(0xA7A7A7A7)
	p:Encode1(0xCA)
	p:Encode1(offsets[id])
	p:Encode4(0xCACACACA)
	p:Encode4(0x00000000)
	p:Encode1(0x00) --Game specific byte
	p:Encode1(0x00) --Game specific byte
	p:Encode1(0x00) --Game specific byte
	p:Encode2(0x0000)
	SendPacket(p)
end
