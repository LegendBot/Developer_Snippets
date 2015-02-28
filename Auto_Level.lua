--[[
  To use, simply uncomment the example you wish to use in your script.
  I created both examples as one saves space in large projects while the other is more precise.
]]

AddLoadCallback(function()
	--AutoLevel({_R,_Q,_E,_W}) --[[Example #1]]
	--AutoLevel({1,3,1,2,1,4,1,2,1,2,4,2,2,3,3,4,3,3}) --[[Example #2]]
	print("Loaded")
end)

class 'AutoLevel'
function AutoLevel:__init(table)
	self.clock = os.clock()
	self.LastLeveled = GetHeroLeveled()
	self.LevelSequence = table
	self.offsets = {[_Q] = 0x83, [_W] = 0x08, [_E] = 0xB5, [_R] = 0xEC,}
	self.SpellSlots = {SPELL_1, SPELL_2, SPELL_3, SPELL_4}
	AddTickCallback(function()
		if os.clock() < (self.clock or 0) then return end
		self.clock = os.clock() + math.random(0.5,2)
		if #self.LevelSequence <= 4 then
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
	local p = CLoLPacket(0x009A)
	p.vTable = 0xF246E0
	p:EncodeF(myHero.networkID)
	p:Encode4(0x5A5A5A5A)
	p:Encode1(0x46)
	p:Encode4(0xD5D5D5D5)
	p:Encode1(self.offsets[ID])
	p:Encode4(0x07070707)
	p:Encode1(0xF8)
	p:Encode1(0xEA)
	p:Encode1(0x0C)
	p:Encode2(0x0000)
	SendPacket(p)
end
