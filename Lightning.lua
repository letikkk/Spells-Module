local Players = game:GetService("Players")
local Lightning = {}

function Lightning.new(char, mousepos)
	
	local Player = Players:GetPlayerFromCharacter(char)
	if Player then
print(mousepos)
		
		local RayParams = RaycastParams.new()
		RayParams.FilterType = Enum.RaycastFilterType.Exclude
		RayParams.FilterDescendantsInstances = {char}

		local RayRes = workspace:Raycast(mousepos.Origin, mousepos.Direction * 1000, RayParams)
		
		if RayRes and RayRes.Instance then
			
			local Lightning = Instance.new("Part")
			Lightning.Size = Vector3.new(2, 20, 2)
			Lightning.Material = Enum.Material.Neon
			Lightning.Color = Color3.fromRGB(255, 219, 39)
			Lightning.Parent = workspace
			Lightning.Position = RayRes.Position
			Lightning.Anchored = true
			
			local Boom = Instance.new("Explosion")
			Boom.Parent = Lightning
			Boom.Position = Lightning.Position
			
			game.Debris:AddItem(Lightning, 1)
			
		end
	end
end

return Lightning
