local UserInputService = game:GetService("UserInputService")
local Spells = require(game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Spells"))
local Plr = game.Players.LocalPlayer
local Char = Plr.Character or Plr.CharacterAdded:Wait()

UserInputService.InputBegan:Connect(function(input, chat)
	local MouseLocation = UserInputService:GetMouseLocation()
	local MouseLocation3d = workspace.CurrentCamera:ViewportPointToRay(MouseLocation.X, MouseLocation.Y)
	if input.KeyCode == Enum.KeyCode.Z then
		Spells.new("Fire", Char, MouseLocation3d)
	elseif input.KeyCode == Enum.KeyCode.X then
		Spells.new("Lightning", Char, MouseLocation3d)
	elseif input.KeyCode == Enum.KeyCode.C then
		Spells.new("Ice", Char)
	end
end)