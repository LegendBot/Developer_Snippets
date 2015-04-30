--[[
  Just run this script along with your other scripts if you wish for LevelSpell to work.
  This only works if you are VIP unfortunately.
]]
if not VIP_USER then return end
print("LevelSpell override is active")

_G.LevelSpell = function(id)
	local offsets = {[_Q] = 0x49, [_W] = 0x41, [_E] = 0x4D, [_R] = 0x45,}
	local p = CLoLPacket(0x009A)
	p.vTable = 0xFC1C78
	p:EncodeF(myHero.networkID)
	p:Encode1(offsets[id])
	p:Encode4(0xACACACAC)
	p:Encode4(0xD8D8D8D8)
	p:Encode1(0xEC)
	p:Encode4(0x0E0E0E0E)
	p:Encode1(0x00)
	p:Encode1(0x00)
	p:Encode1(0x00)
	p:Encode1(0x00)
	p:Encode1(0x00)
	SendPacket(p)
end

--[[Updated for 5.8 - 2015-04-30]]
