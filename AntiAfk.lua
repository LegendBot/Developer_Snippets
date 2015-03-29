class '_AntiAfk'
function _AntiAfk:__init()
	self.Clock = os.clock()
	AddTickCallback(function()
		if os.clock() < self.Clock then return end
		self.Clock = os.clock() + math.random(60,120)
		myHero:MoveTo(myHero.x,myHero.z)
	end)
	AddRecvPacketCallback(function(p)
		if p.header == 0x0027 then
			p.pos = 2
			local nID = p:DecodeF()
			self.Clock = os.clock() + math.random(60,120)
		end
	end)
end

AddLoadCallback(function()
	HookPackets()
	print("Loaded Anit-Afk.")
	print("Please remember that you can still be reported and banned.")
	_AntiAfk()
end)
