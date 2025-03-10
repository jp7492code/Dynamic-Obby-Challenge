
-- AI Opponent Script
local pathfindingService = game:GetService("PathfindingService")
local target = game.Workspace.PlayerSpawn -- The target for the AI to reach
local ai = script.Parent -- This is the AI character (Model)

local function moveAI()
    local path = pathfindingService:CreatePath({
        AgentRadius = 2,  -- Size of the agent
        AgentHeight = 5,
        AgentCanJump = true,
        AgentJumpHeight = 10,
        AgentMaxSlope = 45,
    })
    
    path:ComputeAsync(ai.Position, target.Position)
    path:MoveTo(ai)
end

game:GetService("RunService").Heartbeat:Connect(function()
    moveAI()
end)
