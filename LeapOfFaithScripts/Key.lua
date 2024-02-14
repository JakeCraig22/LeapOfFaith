-- puts key in players inventory on click

local key = script.Parent
local clickDetector = key.Union.ClickDetector
local rope = key.Union.rope

clickDetector.MouseClick:Connect(function(player)
	rope:Destroy()
	local backpack = player.Backpack
	if backpack then
		local keyClone = key:Clone()
		keyClone.Parent = backpack
		key:Destroy()
	end
end)