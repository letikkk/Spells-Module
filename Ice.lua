local TableWithMaterial = {}
local TableWithColor = {}

local Ice = {}

function Ice.new(char)
	for _, part in pairs(char:GetChildren()) do
		if part:IsA("Part") or part:IsA("MeshPart") then
			TableWithMaterial[part] = part.Material
			TableWithColor[part] = part.Color
			part.Material = Enum.Material.Ice
			part.Color = Color3.fromRGB(75, 168, 255)
			part.Anchored = true
		end
	end
	task.delay(10, function()
		for _, part in pairs(char:GetChildren()) do
			if part:IsA("Part") or part:IsA("MeshPart") then
				part.Material = TableWithMaterial[part]
				part.Color = TableWithColor[part]
				part.Anchored = false
			end
		end
	end)
end

return Ice