--[[
  Just run this script along with your other scripts if you wish for LevelSpell to work.
  This only works if you are VIP unfortunately.
]]
if not VIP_USER then return end
print("LevelSpell override is active")

_G.LevelSpell = function(id)
	local offsets = {
		[_Q] = 0xAA,
		[_W] = 0xAB,
		[_E] = 0xAC,
		[_R] = 0xAD,
	}
	local p = CLoLPacket(0x009C)
	p.vTable = 0xEE6D00
	p:EncodeF(myHero.networkID)
	for i = 1, 4 do	p:Encode1(0xB4)	end
	for i = 1, 4 do	p:Encode1(0x69)	end
	for i = 1, 4 do p:Encode1(0x09)	end
	p:Encode1(offsets[id])
	p:Encode1(0xE4)
	p:Encode1(0x00)
	for i = 1, 4 do	p:Encode1(0x00) end
	SendPacket(p)
end
--[[Updated for 5.14 - 2015-07-22]]
