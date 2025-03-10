
-- Procedural Obby Generation Script
local obstaclesFolder = game.Workspace.Obstacles -- Parent folder for obstacles
local obstacleTemplate = game.ReplicatedStorage.ObstacleTemplate -- A template obstacle part

local function generateObbySegment(position)
    local newObstacle = obstacleTemplate:Clone()
    newObstacle.Position = position
    newObstacle.Parent = obstaclesFolder
end

local function generateObby(numSegments)
    local startingPosition = Vector3.new(0, 0, 0)
    for i = 1, numSegments do
        generateObbySegment(startingPosition + Vector3.new(0, 0, i * 10)) -- Generate segments in front of the player
    end
end

-- Generate a new obby every 30 seconds
while true do
    generateObby(5)  -- Generate 5 new segments
    wait(30)
end
