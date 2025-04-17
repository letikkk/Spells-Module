local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Fire = {}

function Fire.new(char, mousepos)
	
	
	local Player = Players:GetPlayerFromCharacter(char)
	
	if Player then
		
		local Connection = nil
		
		local RayParams = RaycastParams.new()
		RayParams.FilterType = Enum.RaycastFilterType.Exclude
		RayParams.FilterDescendantsInstances = {char}
	
	local RayRes = workspace:Raycast(mousepos.Origin, mousepos.Direction * 1000, RayParams)
	if RayRes and RayRes.Instance then
	local Fire = Instance.new("Part")
	Fire.Material = Enum.Material.Neon
	Fire.Color = Color3.fromRGB(255, 42, 0)
	Fire.Shape = Enum.PartType.Ball
	Fire.Size = Vector3.new(1, 1, 1)
	Fire.Parent = workspace
	Fire.Anchored = true
	Fire.CanCollide = false
	print(char.HumanoidRootPart.Position)
	Fire.Position = char.HumanoidRootPart.Position
	
	
	local Target = RayRes.Position
	
		Connection = RunService.RenderStepped:Connect(function(dt)
			
			
			local Goal = RayRes.Position
			
				local Dir = (Goal - Fire.Position).Unit
			
			Fire.Position = Fire.Position + (Dir * dt * 100)
			
			if (Goal - Fire.Position).Magnitude < 1  then
				Connection:Disconnect()
				local Boom = Instance.new("Explosion")
				Boom.Parent = Fire
				Boom.Position = Fire.Position
				game.Debris:AddItem(Fire, 1)
			end
			
			end)
		end
	end
end

return Fire
