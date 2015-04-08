--[[
  To use, simply uncomment the example you wish to use in your script.
  I created both examples as one saves space in large projects while the other is more precise.
]]

AddLoadCallback(function()
	if not VIP_USER then return end
	--AutoLevel({_R,_Q,_E,_W}) --[[Example #1]]
	--AutoLevel({1,3,1,2,1,4,1,2,1,2,4,2,2,3,3,4,3,3}) --[[Example #2]]
	print("Loaded")
end)

class 'AutoLevel'
function AutoLevel:__init(table)
	self.clock = os.clock()
	self.LastLeveled = GetHeroLeveled()
	self.LevelSequence = table
	self.offsets = {[_Q] = 0x75, [_W] = 0xFE, [_E] = 0x52, [_R] = 0x40}
	self.SpellSlots = {SPELL_1, SPELL_2, SPELL_3, SPELL_4}
	AddTickCallback(function()
		if os.clock() < (self.clock or 0) then return end
		self.clock = os.clock() + math.random(0.5,2)
		if #self.LevelSequence == 4 then
			if myHero.level > self.LastLeveled then
				self:LevelSpell(self.LevelSequence[1])
				self:LevelSpell(self.LevelSequence[2])
				self:LevelSpell(self.LevelSequence[3])
				self:LevelSpell(self.LevelSequence[4])
			end
			self.LastLeveled = GetHeroLeveled()
		elseif #self.LevelSequence == 18 then
			self.LastLeveled = GetHeroLeveled()
			if myHero.level > self.LastLeveled and self.LevelSequence[self.LastLeveled + 1] ~= nil then
				self.SpellToLevel = self.LevelSequence[self.LastLeveled + 1]
				if self.SpellToLevel >= 1 and self.SpellToLevel <= 4 then
					self:LevelSpell(self.SpellSlots[self.SpellToLevel])
				end
			end
		end
	end)
end

function AutoLevel:LevelSpell(ID)
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
