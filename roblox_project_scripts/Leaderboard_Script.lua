
-- Leaderboard for Tracking Times
local leaderstats = Instance.new("Folder")
leaderstats.Name = "leaderstats"
leaderstats.Parent = game.Players

game.Players.PlayerAdded:Connect(function(player)
    local time = Instance.new("IntValue")
    time.Name = "Time"
    time.Value = 0
    time.Parent = leaderstats
end)

game.Players.PlayerRemoving:Connect(function(player)
    -- Store the player's score when they leave
    -- Example: save to a database or file
end)
