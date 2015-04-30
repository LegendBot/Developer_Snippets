class '_AntiAfk'
function _AntiAfk:__init()
	self.Clock = os.clock()
	self.Menu = scriptConfig("[Anti-Afk]","AntiAfk")
	self.Menu:addParam("Enabled","Enable Script",1,false)
	AddTickCallback(function()
		if os.clock() < self.Clock or not self.Menu.Enabled then return end
		self.Clock = os.clock() + math.random(60,120)
		myHero:MoveTo(myHero.x,myHero.z)
		print("Anti-Afk: Moving")
	end)
end

AddLoadCallback(function()
	print("Anti-Afk: Loaded.")
	print("Anti-Afk: Please remember that you can still be reported and banned.")
	_AntiAfk()
end)

--[[Updated for 5.8 - 2015-04-30]]
