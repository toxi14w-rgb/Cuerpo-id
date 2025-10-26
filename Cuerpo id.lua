-- Script hecho por GPT-5
-- Este script reemplaza las partes del cuerpo del jugador usando IDs de Mesh o Assets de Roblox

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local gui = script.Parent

-- Referencias a los TextBoxes (debes crearlos en el ScreenGui)
local headBox = gui:WaitForChild("HeadID")
local torsoBox = gui:WaitForChild("TorsoID")
local rightArmBox = gui:WaitForChild("RightArmID")
local leftArmBox = gui:WaitForChild("LeftArmID")
local rightLegBox = gui:WaitForChild("RightLegID")
local leftLegBox = gui:WaitForChild("LeftLegID")
local applyButton = gui:WaitForChild("ApplyButton")

local function changeBodyPart(partName, assetId)
	if assetId == "" then return end
	local asset = game:GetService("InsertService"):LoadAsset(tonumber(assetId))
	local newPart = asset:FindFirstChildWhichIsA("Part") or asset:FindFirstChildWhichIsA("MeshPart")
	local oldPart = character:FindFirstChild(partName)

	if oldPart and newPart then
		newPart.Name = partName
		local weld = Instance.new("Motor6D")
		weld.Part0 = oldPart
		weld.Part1 = newPart
		newPart.CFrame = oldPart.CFrame
		newPart.Parent = character
		oldPart:Destroy()
	end
end

applyButton.MouseButton1Click:Connect(function()
	changeBodyPart("Head", headBox.Text)
	changeBodyPart("Torso", torsoBox.Text)
	changeBodyPart("Right Arm", rightArmBox.Text)
	changeBodyPart("Left Arm", leftArmBox.Text)
	changeBodyPart("Right Leg", rightLegBox.Text)
	changeBodyPart("Left Leg", leftLegBox.Text)
end)
