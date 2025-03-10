
-- Optimized AI Opponent Script with Pathfinding and Obstacle Detection
local pathfindingService = game:GetService("PathfindingService")
local target = game.Workspace.PlayerSpawn -- The target for the AI to reach
local ai = script.Parent -- The AI character (Model)
local maxPathfindingTime = 3 -- Max time for pathfinding calculation (seconds)
local optimizedSpeed = 10 -- Optimized walking speed for NPC

-- Function to move the AI with optimized pathfinding
local function moveAI()
    local path = pathfindingService:CreatePath({
        AgentRadius = 2, 
        AgentHeight = 5, 
        AgentCanJump = true, 
        AgentJumpHeight = 10, 
        AgentMaxSlope = 45,
    })

    -- Pathfinding with optimized timeout
    local success = path:ComputeAsync(ai.Position, target.Position)
    if success and path.Status == Enum.PathStatus.Complete then
        path:MoveTo(ai)
    else
        -- Retry if pathfinding failed
        path:ComputeAsync(ai.Position, target.Position)
    end
end

game:GetService("RunService").Heartbeat:Connect(function()
    moveAI()
end)
