--[[
  Just run this script along with your other scripts if you wish for LevelSpell to work.
  This only works if you are VIP unfortunately.
]]
if not VIP_USER then return end
print("LevelSpell override is active")

_G.LevelSpell = function(ID)
	offsets = {[_Q] = 0x83, [_W] = 0x08, [_E] = 0xB5, [_R] = 0xEC,}
	local p = CLoLPacket(0x009A)
	p.vTable = 0xF246E0
	p:EncodeF(myHero.networkID)
	p:Encode4(0x5A5A5A5A)
	p:Encode1(0x46)
	p:Encode4(0xD5D5D5D5)
	p:Encode1(offsets[ID])
	p:Encode4(0x07070707)
	p:Encode1(0xF8)
	p:Encode1(0xEA)
	p:Encode1(0x0C)
	p:Encode2(0x0000)
	SendPacket(p)
end
