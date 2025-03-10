
-- Difficulty Scaling Script with AI Speed Adjustment Based on Player Progress
local player = game.Players.LocalPlayer
local aiModel = game.Workspace.AI -- Reference to the AI model
local playerTime = 0
local aiSpeed = 10 -- Starting AI speed

-- Adjust difficulty based on player performance and AI speed
local function adjustDifficulty()
    if playerTime < 60 then
        aiSpeed = 10
    elseif playerTime < 120 then
        aiSpeed = 12
    else
        aiSpeed = 15
    end
    aiModel.Humanoid.WalkSpeed = aiSpeed
end

-- Timer for player performance and scaling AI difficulty
while true do
    playerTime = playerTime + 1
    wait(1)
    adjustDifficulty()
end
