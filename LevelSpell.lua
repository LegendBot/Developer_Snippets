--[[
  Just run this script along with your other scripts if you wish for LevelSpell to work.
  This only works if you are VIP unfortunately.
]]

if not VIP_USER then
	_G.LevelSpell = function() print("LevelSpell only works for VIP users") end
return end

print("LevelSpell override is active")
_G.LevelSpell = function(id)
	local offsets = {
		[_Q] = 0xB9,
		[_W] = 0xBD,
		[_E] = 0xD9,
		[_R] = 0xDD,
	}
	local p = CLoLPacket(0x0043)
	p.vTable = 0xE07758
	p:EncodeF(myHero.networkID)
	p:Encode1(0x2E)
	for i = 1, 4 do	p:Encode1(0x9F)	end
	for i = 1, 4 do	p:Encode1(0x9B)	end
	p:Encode1(offsets[id])
	for i = 1, 4 do	p:Encode1(0x72)	end
	p:Encode1(myHero.level-myHero:GetSpellData(_Q).level-myHero:GetSpellData(_W).level-myHero:GetSpellData(_E).level-myHero:GetSpellData(_R).level)
	for i = 1, 4 do	p:Encode1(0x00)	end
	SendPacket(p)
end

--[[Updated for 5.15 - 2015-08-05]]
