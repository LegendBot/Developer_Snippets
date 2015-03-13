--[[
  Just run this script along with your other scripts if you wish for LevelSpell to work.
  This only works if you are VIP unfortunately.
]]
if not VIP_USER then return end
print("LevelSpell override is active")

_G.LevelSpell = function(id)
	local offsets = {[_Q] = 0x75, [_W] = 0xFE, [_E] = 0x52, [_R] = 0x40}
	local p = CLoLPacket(0x012D)
	p.vTable = 0xDF5388
	p:EncodeF(myHero.networkID)
	p:Encode1(offsets[id])
	p:Encode4(0x65656565)
	p:Encode4(0x51515151)
	p:Encode1(0x50)
	p:Encode4(0x63636363)
	p:Encode1(0x00)
	p:Encode1(0x00)
	p:Encode1(0x00)
	p:Encode2(0x0000)
	SendPacket(p)
end
