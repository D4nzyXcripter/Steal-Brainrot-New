local G2L = {};

-- StarterGui.s
G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["1"]["Name"] = [[s]];
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;

-- StarterGui.s.Steal
G2L["2"] = Instance.new("Frame", G2L["1"]);
G2L["2"]["Visible"] = false;
G2L["2"]["BorderSizePixel"] = 0;
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(37, 37, 45);
G2L["2"]["Size"] = UDim2.new(0.14286, 0, 0.18699, 0);
G2L["2"]["Position"] = UDim2.new(0.62995, 0, 0.29675, 0);
G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2"]["Name"] = [[Steal]];


-- StarterGui.s.Steal.up/down
G2L["3"] = Instance.new("TextButton", G2L["2"]);
G2L["3"]["BorderSizePixel"] = 0;
G2L["3"]["TextSize"] = 14;
G2L["3"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3"]["BackgroundColor3"] = Color3.fromRGB(116, 116, 116);
G2L["3"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["3"]["Size"] = UDim2.new(0.88435, 0, 0.36957, 0);
G2L["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3"]["Text"] = [[UP]];
G2L["3"]["Name"] = [[up/down]];
G2L["3"]["Position"] = UDim2.new(0.05442, 0, 0.31522, 0);


-- StarterGui.s.Steal.up/down.LocalScript
G2L["4"] = Instance.new("LocalScript", G2L["3"]);


-- StarterGui.s.Steal.TextLabel
G2L["5"] = Instance.new("TextLabel", G2L["2"]);
G2L["5"]["TextWrapped"] = true;
G2L["5"]["BorderSizePixel"] = 0;
G2L["5"]["TextSize"] = 14;
G2L["5"]["TextScaled"] = true;
G2L["5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["5"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5"]["BackgroundTransparency"] = 1;
G2L["5"]["Size"] = UDim2.new(0.44218, 0, 0.18478, 0);
G2L["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5"]["Text"] = [[steal]];
G2L["5"]["Position"] = UDim2.new(0, 0, -0.00905, 0);

-- StarterGui.s.LocalScript
G2L["a"] = Instance.new("LocalScript", G2L["1"]);

-- StarterGui.s.Steal.up/down.LocalScript
local function C_4()
local script = G2L["4"];
	local button = script.Parent
	local player = game:GetService("Players").LocalPlayer
	local char = player.Character or player.CharacterAdded:Wait()
	local root = char:WaitForChild("HumanoidRootPart")
	
	local function updateCharacter()
		char = player.Character or player.CharacterAdded:Wait()
		root = char:WaitForChild("HumanoidRootPart")
	end
	
	local function teleportToSky()
		if not root then updateCharacter() end
		if root then
			root.CFrame = root.CFrame + Vector3.new(0, 200, 0)
		end
	end
	
	local function teleportToGround()
		if not root then updateCharacter() end
		if root then
			root.CFrame = root.CFrame - Vector3.new(0, 50, 0)
		end
	end
	
	local teleportState = "UP"
	
	button.MouseButton1Click:Connect(function()
		if teleportState == "UP" then
			teleportToSky()
			button.Text = "DOWN"
			teleportState = "DOWN"
		else
			teleportToGround()
			button.Text = "UP"
			teleportState = "UP"
		end
	end)
	
	player.CharacterAdded:Connect(function(newChar)
		char = newChar
		root = newChar:WaitForChild("HumanoidRootPart")
	end)
end;
task.spawn(C_4);

return G2L["1"], require;
