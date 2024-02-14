# LeapOfFaith
This challenge contains three scripts

Key.lua - on click of the object (the key) the key will be placed into the users inventory. Aksi the rope holding the key is destroyed

UnlockPuzzle.lua - This script has a few different functions:
- Clickable puzzle pieces from serverStorage are placed inside a list
- The visible pieces (not clickable) in workspace are placed inside of a list
- Placeholders (areas that can be clicked to place puzzle pieces) are placed inside of a list
- keys are placed inside of a list
- locks are placed inside of a list
- Initializes numLocks (the number of locks unlocked) and equals it to 0
- Destroys locks on click if the user has the corresponding key
- Checks if all four locks have been unlocked, if they have, the ServerStorage
puzzle pieces are put into workspace while the clonePieces in workspace are destroyed.
- Sets clickDetector distance to 10 for placeholders
- Enables the StingRayPuzzle script allowing for the user to do the puzzle

StingRayPuzzle.lua - All functions to do the puzzle, which include:
- initializing and setting a currentPiece variable to nil
- Everytime a puzzle piece is clicked, sets currentPiece to the clicked puzzle piece, currentPiece set back to nil
- Places the currentPiece to the position of the clicked object within the PlaceObject list
- Allows for rotation of the currentPiece by right clicking

Demo: https://youtu.be/SI_9Kn85KcM
