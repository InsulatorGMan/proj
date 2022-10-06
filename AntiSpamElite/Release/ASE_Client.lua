local ReplicatedStorage = game:GetService('ReplicatedStorage')
local ASE_Shared = ReplicatedStorage["ASE_Shared"]

local player = game.Players.LocalPlayer

player.Chatted:Connect(function(Message)

    ASE_Shared["ASE_Trigger"]:FireServer(player, Message)

end)