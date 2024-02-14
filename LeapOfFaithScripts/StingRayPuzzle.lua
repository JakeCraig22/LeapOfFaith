--[[
Puzzle script, once puzzle is unlocked, the puzzle pieces are able to be clicked and placed into
any of the positions of the objects on the PlaceObject list. 
]]

local puzzle = script.Parent
local puzzlePieces = puzzle.PuzzlePieces
local clickToPlace =  puzzle.ClickToPlace

local PuzzlePiece = {
	puzzlePieces.Piece1,
	puzzlePieces.Piece2,
	puzzlePieces.Piece3,
	puzzlePieces.Piece4,
	puzzlePieces.Piece5,
	puzzlePieces.Piece6,
	puzzlePieces.Piece7,
	puzzlePieces.Piece8,
	puzzlePieces.Piece9,
	puzzlePieces.Piece10,
}

local PlaceObject = {
	clickToPlace.Puzzle1,
	clickToPlace.Puzzle2,
	clickToPlace.Puzzle3,
	clickToPlace.Puzzle4,
	clickToPlace.Puzzle5,
	clickToPlace.Puzzle6,
	clickToPlace.Puzzle7,
	clickToPlace.Puzzle8,
	clickToPlace.Puzzle9,
	clickToPlace.Puzzle10,
	clickToPlace.Placeholder1,
	clickToPlace.Placeholder2,
	clickToPlace.Placeholder3,
	clickToPlace.Placeholder4,
	clickToPlace.Placeholder5,
	clickToPlace.Placeholder6
}

local currentPiece = nil -- sets it so that no piece has been clicked yet

local function rightClick(piece) -- rotates the currentPiece on right click
	piece.CFrame = piece.CFrame * CFrame.Angles(0, math.rad(45), 0)
end

local function onPuzzlePieceClicked(piece, input) -- sets piece clicked as currentPiece
	currentPiece = piece
end

local function onPlaceObjectClicked(object) -- the puzzle piece clicked last is placed on the placeObject position
	if currentPiece then 
		currentPiece.Position = object.Position
		currentPiece = nil -- sets current piece to nothing, so a new piece can be clicked	
	end
end

-- puzzle piece click event
for i, piece in ipairs(PuzzlePiece) do
	piece.ClickDetector.MouseClick:Connect(function()
		onPuzzlePieceClicked(piece)
		print(currentPiece)
	end)
end

-- PlaceObject click events
for i, object in ipairs(PlaceObject) do
	object.ClickDetector.MouseClick:Connect(function()
		onPlaceObjectClicked(object)
	end)
end

-- Right click event
for i, piece in ipairs(PuzzlePiece) do
	piece.ClickDetector.RightMouseClick:Connect(function()
		rightClick(piece)
	end)
end
