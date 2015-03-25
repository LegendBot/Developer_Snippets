class '_AntiAfk'
function _AntiAfk:__init()
	self.Clock = os.clock()
	AddTickCallback(function()
		if os.clock() < self.Clock then return end
		myHero:MoveTo(myHero.x,myHero.z)
	end)
	AddSendPacketCallback(function(p)
		if p.header == 0x00BF then
			self.Clock = os.clock() + math.random(60,170)
		end
	end)
end

AddLoadCallback(function()
	print("Loaded Anit-Afk")
	_AntiAfk()
end)
