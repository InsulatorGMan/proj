local ReplicatedStorage = game:GetService('ReplicatedStorage')
local ServerScriptService = game:GetService('ServerScriptService')
local Players = game:GetService('Players')
local Chat = game:GetService('Chat')

local ASE_Folder = ServerScriptService:WaitForChild('ASE')
local ASE_Shared = ReplicatedStorage:WaitForChild('ASE_Shared')
local ASE_Client = ASE_Folder['ASE_Client']
local ASE_Config = require(ASE_Folder['ASE_Config'])

--//---\\--

ASE_Shared['ASE_Trigger'].OnServerEvent:Connect(function(Player, Message)
    
    if Player:IsA('Player') and Message then

        if Message == Player["LastMessage"].Value then

            if Player['Damage'].Value >= ASE_Config.DamageRequiredToKick.Value then
                
                if ASE_Config.AlertAllUsers == true then workspace["[ASE]"]:Chat('Player: '..Player.Name.." has been kicked for spamming") else return end
                Player:Kick()

            else
                
                if ASE_Config.WarnIfSpamming then

                    workspace["[ASE]"]:Chat('Stop spamming '..Player.Name)

                end    

            end    

        else
            
            Player["LastMessage"].Value = tostring(Message)

        end    

    end    

end)

Players.PlayerAdded:Connect(function(player)
    
    local ClientScript = ASE_Client:Clone()
    ClientScript.Parent = player

    local Damage = Instance.new('NumberValue', player)
    Damage.Name = 'Damage'
    Damage.Value = 0

    local LastMessage = Instance.new('StringValue', player)
    LastMessage.Name = 'LastMessage'
    LastMessage.Value = ''

end)
