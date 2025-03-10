
-- Leaderboard Script with Detailed Score Tracking
local DataStoreService = game:GetService("DataStoreService")
local playerScores = DataStoreService:GetDataStore("PlayerScores")

-- Function to save player score when they leave
game.Players.PlayerRemoving:Connect(function(player)
    local score = player.leaderstats.Time.Value
    local success, errorMessage = pcall(function()
        playerScores:SetAsync(player.UserId, score)
    end)

    if not success then
        warn("Failed to save score for " .. player.Name .. ": " .. errorMessage)
    end
end)

-- Function to load player score on join
game.Players.PlayerAdded:Connect(function(player)
    local score
    local success, errorMessage = pcall(function()
        score = playerScores:GetAsync(player.UserId)
    end)

    if success and score then
        player.leaderstats.Time.Value = score
    else
        player.leaderstats.Time.Value = 0
    end
end)
