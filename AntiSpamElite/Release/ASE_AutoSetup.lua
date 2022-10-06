-- ASE AutoSetup

local ASE_Folder = Instance.new('Folder',game.ServerScriptService)
ASE_Folder.Name = 'ASE'

local ASE_Shared = Instance.new('Folder',game.ServerScriptService)
ASE_Folder.Name = 'ASE_Shared'


local Scripts = script.Parent.Scripts

Scripts["ASE_Client"].Parent = ASE_Folder
Scripts["ASE_Main"].Parent = ASE_Folder
Scripts["ASE_Config"].Parent = ASE_Folder

local Trigger = Instance.new('RemoteEvent', ASE_Shared)
Trigger.Name = 'ASE_Trigger'

local ASE_Instance = Instance.new('Part', workspace)
ASE_Instance.Name = '[ASE]'
ASE_Instance.Size = Vector3.new(0,0,0)
ASE_Instance.CanCollide = false
ASE_Instance.Visible = false

wait(3)
script.Parent:Destroy()