
-- Difficulty Scaling Script (Adjust AI Speed Based on Player Performance)
local player = game.Players.LocalPlayer
local ai = game.Workspace.AI -- Reference to the AI model
local playerTime = 0
local aiSpeed = 10 -- Starting AI speed

-- Adjust difficulty based on player performance
local function adjustDifficulty()
    if playerTime < 60 then
        aiSpeed = 10
    elseif playerTime < 120 then
        aiSpeed = 12
    else
        aiSpeed = 15
    end
    ai.Humanoid.WalkSpeed = aiSpeed
end

-- Timer for player performance
while true do
    playerTime = playerTime + 1
    wait(1)
    adjustDifficulty()
end
