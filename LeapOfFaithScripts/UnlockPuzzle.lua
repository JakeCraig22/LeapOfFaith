--[[
Once all 4 keys are gathered and are in the players inventory, each lock is clicked and will dissapear.
Once all 4 locks are clicked, the net covering the puzzle pieces will also be destroyed. Once these
events happen, the script to the puzzle is enabled and the puzzle pieces become clickable.
]]


local Puzzle = script.Parent
local FolderLocation = Puzzle.PuzzlePieces
local net = Puzzle.PuzzlePieces.Net
local pieces = {

}
-- puts the clickable pieces from server storage into the empty pieces list
for i, v in pairs(game.ServerStorage.StingrayPuzzlePiecesBlue:GetDescendants()) do
	if v:IsDescendantOf(game.ServerStorage.StingrayPuzzlePiecesBlue) then
		table.insert(pieces, v) 
	end
end

local ClonePieces = {

}
-- inserts the clone pieces (current visible workspace pieces) into the clonepieces list
for i,v in pairs(FolderLocation:GetDescendants()) do
	if v:IsDescendantOf(FolderLocation) then
		table.insert(ClonePieces, v)
	end
end

local PlaceHolders = {
	Puzzle.ClickToPlace.Placeholder1,
	Puzzle.ClickToPlace.Placeholder2,
	Puzzle.ClickToPlace.Placeholder3,
	Puzzle.ClickToPlace.Placeholder4,
	Puzzle.ClickToPlace.Placeholder5,
	Puzzle.ClickToPlace.Placeholder6
}


local keys = {
	Puzzle.keys.Key1,
	Puzzle.keys.Key2,
	Puzzle.keys.Key3,
	Puzzle.keys.Key4
}

local locks = {
	FolderLocation.Lock1.ClickDetector,
	FolderLocation.Lock2.ClickDetector,
	FolderLocation.Lock3.ClickDetector,
	FolderLocation.Lock4.ClickDetector
}

local numLocks = 0


local function check(locks) -- function to check if all 4 locks have been unlocked
	if numLocks == 4 then 
		print("All locks are destroyed!")
		net:Destroy()
		for i,v in ipairs(ClonePieces) do -- destroys clonepieces
			v:Destroy()
		end
		-- clone new puzzle pieces
		for i,v in ipairs(pieces) do
			v:Clone().Parent = FolderLocation
		end

		for i,v in ipairs(PlaceHolders) do -- sets click detector to table puzzlepiece placements distance to 10
			v.ClickDetector.MaxActivationDistance = 10
		end

		local StringRayScript = Puzzle.StringrayPuzzle -- enables the puzzle to be started
		StringRayScript.Enabled = true
	end
end

for i, lockClickDetector in ipairs(locks) do -- Function to unlock locks, everytime a lock is unlocked, the numLocks goes up by 1
	lockClickDetector.MouseClick:Connect(function(player)
		local backpack = player.Backpack
		local key = keys[i]
		
		if backpack and key and backpack:FindFirstChild(key.Name) then
			lockClickDetector.Parent:Destroy()
			numLocks = numLocks + 1
			check(locks)
			print("Lock Destroyed")
			
		end
	end)
end



--[[
net.MouseClick:Connect(function()
	for i,v in ipairs(ClonePieces) do
		v:Destroy()
	end

	for i,v in ipairs(pieces) do
		v:Clone().Parent = FolderLocation
	end

	for i,v in ipairs(PlaceHolders) do
		v.ClickDetector.MaxActivationDistance = 10
	end

	local StringRayScript = Puzzle.StringrayPuzzle
	StringRayScript.Enabled = true

end)
]]