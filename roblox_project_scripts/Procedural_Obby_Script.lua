
-- Procedural Obby Generation for Multiplayer (Dynamic Obstacles)
local obstaclesFolder = game.Workspace.Obstacles -- Folder for obstacles
local obstacleTemplate = game.ReplicatedStorage.ObstacleTemplate
local movingPlatformTemplate = game.ReplicatedStorage.MovingPlatformTemplate
local speedBoostTemplate = game.ReplicatedStorage.SpeedBoostTemplate

local function generateRandomObstacle(position)
    local randomType = math.random(1, 3)
    local newObstacle

    if randomType == 1 then
        newObstacle = obstacleTemplate:Clone() -- Standard obstacle
    elseif randomType == 2 then
        newObstacle = movingPlatformTemplate:Clone() -- Moving platform
    else
        newObstacle = speedBoostTemplate:Clone() -- Speed boost
    end

    newObstacle.Position = position
    newObstacle.Parent = obstaclesFolder
end

local function generateObbySegment(position)
    generateRandomObstacle(position)
end

local function generateObby(numSegments)
    local startingPosition = Vector3.new(0, 0, 0)
    for i = 1, numSegments do
        generateObbySegment(startingPosition + Vector3.new(0, 0, i * 10))
    end
end

-- Multiplayer-friendly, procedural generation triggered on player join
game.Players.PlayerAdded:Connect(function(player)
    generateObby(10) -- Start with 10 segments for new players
end)
