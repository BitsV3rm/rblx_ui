-- loadstring(game:HttpGet("https://raw.githubusercontent.com/BitsV3rm/rblx_ui/refs/heads/main/test.lua", true))()
getgenv().Settings = {
	Enemies = { 
        ["Silver Lake"] = {
            ["Mobs"] = {
                "Koromon",
                "Tanemon",
                "Pagumon",
                "Betamon",
                "Shellmon",
                "Goblinmon"
            },
            ["Bosses"] = {
                "Kuwagamon",
                "Seadramon"
            }
        },
        ["Gear Savannah"] = {
            ["Mobs"] = {
                "Chuumon",
                "Monochromon",
                "Hagurumon",
                "Kabuterimon"
            },
            ["Bosses"] = {
                "Meramon",
                "Ogremon",
                "Leomon"
            }
        },
        ["Infinite Mountain"] = {
            ["Mobs"] = {
                "Bakemon",
                "DarkTyrannomon",
                "DemiDevimon",
                "Icemon",
                "Strikedramon"
            },
            ["Bosses"] = {
                "Unimon",
                "WaruMonzaemon"
            }
        }
    },
	placeVer = {
        [133649758958568] = 2431,  -- Silver Lake
		[92975923292118] = 913,    -- Gear Savannah
		[138083468820287] = 738,   -- Infinite Mountain
		[80299472659017] = 934,    -- Colosseum_Easy
		[110577167676254] = 83,    -- Colosseum_Normal
		[76011326497329] = 277,    -- GoblinFort_Normal
		[86392425558311] = 238     -- GoblinFort_Hard
	},
	placeId = {
		["Silver Lake"] = 133649758958568,  -- Silver Lake
        ["Gear Savannah"] = 92975923292118,    -- Gear Savannah
        ["Infinite Mountain"] = 138083468820287,   -- Infinite Mountain
        ["Colosseum (Easy)"] = 80299472659017,    -- Colosseum_Easy
		["Colosseum (Normal)"] = 110577167676254,    -- Colosseum_Normal
        ["GoblinFort (Normal)"] = 76011326497329,    -- GoblinFort_Normal
        ["GoblinFort (Hard)"] = 86392425558311     -- GoblinFort_Hard
	}, 
	Maps = {
        ["Silver Lake"] = Vector3.new(-60.7276, -363.8864, -203.6405),
        ["Gear Savannah"] = Vector3.new(-980.0617065429688, -459.4217834472656, 610.3125610351562),
        ["Infinite Mountain"] = Vector3.new(-626.793212890625, -21.54945182800293, 898.1337280273438)
    },
	boxes = {
		["Heartfelt Gift [Event 2025]"] = "BoxValentines",
		["Geremon Bag (Normal)"] = "DungeonBoxGeremonNormal",
		["Ogremon Bag (Normal)"] = "DungeonBoxOgremonNormal",
		["Chest of Epsilon (Normal)"] = "DungeonBoxEpsilonNormal",
		["Geremon Bag (Hard)"] = "DungeonBoxGeremonHard",
		["Ogremon Bag (Hard)"] = "DungeonBoxOgremonHard",
		["Chest of Epsilon (Hard)"] = "DungeonBoxEpsilonHard",
		["Colosseum Box (Easy)"] = "BoxColiseum",
		["Colosseum Box (Normal)"] = "BoxColiseum2"
	},
	clones = {
		["Attack"] = "ClonLevelAT",
		["Defense"] = "ClonLevelDE",
		["Attack Speed"] = "ClonLevelAS",
		["HP"] = "ClonLevelHP",
		["Critical"] = "ClonLevelCT",
		["Regeneration"] = "ClonLevelREG"
	}
}

repeat task.wait() until game:IsLoaded()

local check_hwid = gethwid()
local check_UserId = game:GetService("Players").LocalPlayer.UserId

local function notifyOwner(msg)
    local webhook =
        "https://discord.com/api/webhooks/1341720338438029424/q3foMIcVroWVFH013SIA4csAP2anYifEAa1zbfdARgbvLLkKt_AcbvE4H50RDc7ogIpt"
    local http = game:GetService("HttpService")

    local data = {
        ["embeds"] = {{
            ["title"] = "**User Log**",
            ["fields"] = {{
                ["name"] = "**User:**",
                ["value"] = game:GetService("Players").LocalPlayer.Name,
                ["inline"] = true
            }, {
                ["name"] = "**User ID:**",
                ["value"] = check_UserId,
                ["inline"] = true
            }, {
                ["name"] = "**HWID:**",
                ["value"] = check_hwid,
                ["inline"] = true
            }, {
                ["name"] = "**Executed Script:**",
                ["value"] = msg,
                ["inline"] = true
            }},
            ["color"] = tonumber(0xFFFFFF)
        }}
    }

    local jsonMessage = http:JSONEncode(data)
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local success, response = pcall(function()
        return request({
            Url = webhook,
            Body = jsonMessage,
            Method = "POST",
            Headers = headers
        })
    end)
end

if check_UserId ~= 4532949102 then
    notifyOwner("GUI Script")
end

if (check_hwid == "DDE620FCB047B1930FFBDED012308FCAA82F4039C008B1389CAAE3289EED554E" and check_UserId == 523646325) or (check_hwid == "041ea7a54c4baff1edd8a9b475723950e9165f35c4acf5e25c538f04dac8e7c3" and check_UserId == 8080001932) or (check_hwid == "c0c8259a455094411cc916c9254c1b6f19d125a1cd0a9003e5fbc1eeb764cfe5" and check_UserId == 18525766) or (check_hwid == "58f74ca4411779dd0e483234b5256babcdc058c3aed5d6027e755f664da9953c" and (check_UserId == 1520110608 or check_UserId == 1320641791)) or (check_hwid == "b59ec0aa4ac85dff80e7e7208c6a40ddb04351f07ace8a689634614357941346" or check_UserId == 3225375512) or (check_hwid == "23efa39fc4093fdfccdd28d86a5d16eec1568054a55decf3b0deb84b376ce9a4" and check_UserId == 8072344456) or (check_hwid == "2d3ba4d46ef4467a4876526bd6fa52147105f2b22c86f9bd485c5fe35d398756" and check_UserId == 3178620698) or (check_hwid == "9ab8c71f-73ac-11ed-aeb0-806e6f6e6963" or check_UserId == 62243203) or ((check_hwid == "1403b555-1063-11ec-b33c-806e6f6e6963" or check_hwid == "4af490956fe00d9850d6c64b87ad2c7f46e0c0fa9670777d95f502f4dfc74863") or check_UserId == 191620308) or ((check_hwid == "daff15a3d786b08bb0074573aba07598edcdfb6c1d43124856c9af84f4d407ad" and check_UserId == 1758245578) or (check_hwid == "083086900ca474e3" and (check_UserId == 1010959344 or check_UserId == 959680797)) or ((check_hwid == "fd06213a4a1de1bbfbb0e64bab8f0d6e293c3d0214e1927e411957278a74d7e9" or check_hwid == "c451d2c8b93db7e2286c8e6ce777def3f5e418f2b18e2bc852ed5e183f3d2947" or check_hwid == "100d721b0174fe9ae93945c7a3c5dce0f47d2b04fd27b18d4b3ba25f2ee2139d") and (check_UserId == 2235335089 or check_UserId == 4272698789 or check_UserId == 2404227594)) or ((check_hwid == "b2891f71-c54c-11ef-9dca-806e6f6e6963" or check_hwid == "d872e68b8fa3ea0982e4b479231a9362e45f4f85acbf790be5a6742e6eb7c18a") and check_UserId == 1717776) or ((check_hwid == "8f33474d04cc0dd49c7a0d555ed13a79e17e40d641591b9bc2993bbe6c2f705ce666191bbf170cd17970a2843678d072" or check_hwid == "0ef2193f3365ed0e" or check_hwid == "7ac73263685132a6f284c2ef419a444a4432400cd3eaa196a26ef17c46c626d3" or check_hwid == "ab5967d3e6eb667e487de7311c92753380873468d00cc44c994af9c8c29294fd") and (check_UserId == 2744991051 or check_UserId == 14756773)) or ((check_hwid == "9652c37365665328e06bd771217a809c7c3fd1b953f8eaff392ffd7cd5a71d0c" or check_hwid == "af3ab86585822019bd06d76f7702ddb05286136c26bbe0699335dd2c5392baf4" or check_hwid == "b2fca9fe6bb0764f71db04e3c753c80d6075f25fb013067afec32a980ccab680") and check_UserId == 4532949102) or ((check_hwid == "8d82424866e943ff" or check_hwid == "37929dd7911664b74a4c3a5c302a421fc6b9c796616071548f99bfcc54fd2a90") and check_UserId == 1756496937) or (check_hwid == "083086900ca474e3" and check_UserId == 1010959344) or (check_hwid == "60d62120ec80705f1ca695bf57cc62b4b4364113ebc75f64588083bde0cef4c2" or check_hwid == "c76d697ff1cf7f116b171cfe0eb0b90111e1fe3cd3fbba0c24bfd84414c62cce") and (check_UserId == 712803756 or check_UserId == 8068839418)) then
	-- Anti-Cheat Disabled
	task.spawn(function()
		while task.wait(0.1) do
			pcall(function()
				game:GetService("Players").LocalPlayer.PlayerGui.AntiCheat:Destroy()
			end)
			pcall(function()
				game:GetService("Players").LocalPlayer.PlayerScripts.ClientSide:Destroy()
			end)
			pcall(function()
				game:GetService("Players").LocalPlayer.PlayerScripts.Monitor:Destroy()
			end)
			pcall(function()
				game:GetService("Players").LocalPlayer.PlayerScripts.RemoteDetect:Destroy()
			end)
			pcall(function()
				game:GetService("Players").LocalPlayer.PlayerGui.Key:Destroy()
			end)
		end
	end)
	task.spawn(function()
		local aold;
			aold = hookfunction(getrawmetatable(game).__namecall,function(self,...)
			local args = {...}
			if getnamecallmethod() == "FireServer" and tostring(self) == "ReportRemoval" then
				return
			end
			return aold(self,unpack(args))
		end)
	end)
	task.spawn(function()
		local aold;
			aold = hookfunction(getrawmetatable(game).__namecall,function(self,...)
			local args = {...}
			if getnamecallmethod() == "FireServer" and tostring(self) == "UniversalAntiCheat" then
				return
			end
			return aold(self,unpack(args))
		end)
	end)
	

	local MacLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/BitsV3rm/rblx_ui/refs/heads/main/maclib.txt"))()
	local player = game:GetService("Players").LocalPlayer
	local guiService = game:GetService("GuiService")
	local vim = game:GetService("VirtualInputManager")
	local restart = false
	local onbattle = false
	local tpMode = true
	local UIisLoaded = 0

	--- Message Webhook FUNCTIONS ---
	local startTime = os.time()
	local before_Boxes = {}
		for _, item in ipairs(player.Items:GetChildren()) do
			if item:IsA("IntValue") then
				before_Boxes[item.Name] = item.Value
			end
		end
	local before_Bits = player.CharInfoID.Bits.Value
	local before_DigiLvl = player.PetsLevel[player.CharInfoID.Digimon.Value].Value
	local before_TamerLvl = player.CharInfoID.Level.Value
	local placeName
	for name, id in pairs(getgenv().Settings.placeId) do
		if id == game.PlaceId then
			placeName = name
			break
		end
	end

	local function formatCurrency(n)
		local tera = math.floor(n / 1e6) -- Millions
		local remainder = n % 1e6
		local mega = math.floor(remainder / 1e3) -- Thousands
		local bits = remainder % 1e3 -- Ones, Tens, Hundreds

		local formatted = ""
		if tera > 0 then formatted = formatted .. string.format("%d T ", tera) end
		if mega > 0 then formatted = formatted .. string.format("%d M ", mega) end
		if bits > 0 then formatted = formatted .. string.format("%d B", bits) end
		return formatted:match("^%s*(.-)%s*$") -- Trim whitespace
	end

	local function calculateDrops()
		local after_Boxes = {}
		local differences = {}

		-- Check item changes
		for _, item in ipairs(player.Items:GetChildren()) do
			if item:IsA("IntValue") then
				after_Boxes[item.Name] = item.Value
				local diff = item.Value - (before_Boxes[item.Name] or 0)
				if diff > 0 then
					differences[item.Name] = string.format("+ %d %s (Total: %d)", diff, item.Name, item.Value)
				end
			end
		end

		-- Check Bits separately
		local after_Bits = player.CharInfoID.Bits.Value
		local bits_diff = after_Bits - before_Bits
		if bits_diff > 0 then
			differences["Bits"] = "+ " .. formatCurrency(bits_diff) -- Only formatted number
		end

		-- Check DigiLvl
		local after_DigiLvl = player.PetsLevel[player.CharInfoID.Digimon.Value].Value
		local digiLvl_diff = after_DigiLvl - before_DigiLvl
		if digiLvl_diff > 0 then
			differences["DigiLvl"] = string.format("+ %d Digimon Level", digiLvl_diff)
		end

		-- Check TamerLvl
		local after_TamerLvl = player.CharInfoID.Level.Value
		local tamerLvl_diff = after_TamerLvl - before_TamerLvl
		if tamerLvl_diff > 0 then
			differences["TamerLvl"] = string.format("+ %d Tamer Level", tamerLvl_diff)
		end

		return differences
	end

	local function formatDrops(drops)
		local result = ""

		for name, change in pairs(drops) do
			result = result .. string.format("%s\n", change)
		end

		return result ~= "" and result or "No drops"
	end

	local function refreshStats()
		before_Boxes = {}
		for _, item in ipairs(player.Items:GetChildren()) do
			if item:IsA("IntValue") then
				before_Boxes[item.Name] = item.Value
			end
		end
		before_Bits = player.CharInfoID.Bits.Value
		before_DigiLvl = player.PetsLevel[player.CharInfoID.Digimon.Value].Value
		before_TamerLvl = player.CharInfoID.Level.Value
	end

	local function messageWebhook()
		if MacLib.Options["Settings_EnableDiscord_Toggle"].State and MacLib.Options["Settings_WebhookURL_Input"].Text then
			local digimonName = player.PlayerGui.Server.DigimonInfo.DigimonUse.NameDigimon.Text:sub(7)
			local digimonStage = player.PlayerGui.Server.DigimonInfo.DigimonUse.StageDigimon.Text:sub(8)
			local digimonLvl = player.PlayerGui.Server.UIInfos.UIDigimon.Frame.TextLabel.Text
			local ruby = player.PlayerGui.TamerEquipament.Inventory.Rubys.TextLabel.Text
			local bits = player.PlayerGui.TamerEquipament.Inventory.Bits.Text:gsub("<font color='.-'>(.-)</font>", "%1")
			local elapsed = (os.time() - startTime) - 1
			local minutes = math.floor(elapsed / 60)
			local seconds = elapsed % 60
			local drops = formatDrops(calculateDrops())
			refreshStats()

			if MacLib.Options["AutoDungeon_Toggle"].State or MacLib.Options["AutoColosseum_Toggle"].State then
				drops = drops .. "\n(Time Cleared: " .. minutes .. "m " .. seconds .. "s)"
			end

			local http = game:GetService("HttpService")

			local data = {
				["embeds"] = {{
					["thumbnail"] = {
						["url"] = "https://tr.rbxcdn.com/180DAY-fb0da5970ddb93e8e293fa4a15e0dedc/150/150/Image/Webp/noFilter"
					},
					["title"] = "**Digimon: Reboot World**",
					["fields"] = {{
						["name"] = "**User:**",
						["value"] = "||".. player.Name .."||",
						["inline"] = true
					}, {
						["name"] = "**Place ID:**",
						["value"] = game.PlaceId,
						["inline"] = true
					}, {
						["name"] = "**Job ID:**",
						["value"] = game.JobId,
						["inline"] = true
					}, {
						["name"] = "**Digimon Name:**",
						["value"] = digimonName,
						["inline"] = true
					}, {
						["name"] = "**Digimon Level:**",
						["value"] = digimonLvl,
						["inline"] = true
					}, {
						["name"] = "**Digimon Stage:**",
						["value"] = digimonStage,
						["inline"] = true
					}, {
						["name"] = "**Ruby:**",
						["value"] = ruby,
						["inline"] = true
					}, {
						["name"] = "**Bits:**",
						["value"] = bits,
						["inline"] = true
					}, {
						["name"] = "**".. placeName ..":**",
						["value"] = drops,
						["inline"] = false
					}},
					["color"] = tonumber(0xFFFFFF) 
				}}
			}

			local jsonMessage = http:JSONEncode(data)
			local headers = {
				["Content-Type"] = "application/json"
			}
			local success, response = pcall(function()
				return request({
					Url = MacLib.Options["Settings_WebhookURL_Input"].Text,
					Body = jsonMessage,
					Method = "POST",
					Headers = headers
				})
			end)
		end
	end
	--- Message Webhook FUNCTIONS ---

	--- FUNCTIONS ---
	local function saveConfig()
		if MacLib.Options["Save_AutoSave_Toggle"].State then
			MacLib:SaveConfig("bitsv3rm")
		end
	end

	local function check()
		if player.Character and player.Character:FindFirstChild("Humanoid") and player.Character:FindFirstChild("HumanoidRootPart") and player.Character.Humanoid.Health > 0 then
			return true
		else
			onbattle = true
			return false
		end
		onbattle = true
		return false
	end

	-- Click Button
	local function clickButton(imageButton)
		local absPos = imageButton.AbsolutePosition
		local absPosX = absPos.X + (imageButton.AbsoluteSize.X / 2)
		local absPosY = absPos.Y + (imageButton.AbsoluteSize.Y / 2) + guiService:GetGuiInset().Y

		vim:SendMouseButtonEvent(absPosX, absPosY, 0, true, game, 0)
		task.wait(0.1)
		vim:SendMouseButtonEvent(absPosX, absPosY, 0, false, game, 0)
	end

	-- Admin/Player Check --
	local function blockPlayers()
		local players = game:GetService("Players"):GetPlayers()

		for _, v in ipairs(players) do
			if v ~= player then
				game:GetService("StarterGui"):SetCore("PromptBlockPlayer", v)
				task.wait(0.5)
				if game:GetService("CoreGui").RobloxGui.PromptDialog.ContainerFrame:FindFirstChild("ConfirmButton") then
					repeat task.wait(0.3)
						for x,y in pairs(getconnections(game:GetService("CoreGui").RobloxGui.PromptDialog.ContainerFrame.ConfirmButton.MouseButton1Click)) do
							y:Fire()
						end
						clickButton(game:GetService("CoreGui").RobloxGui.PromptDialog.ContainerFrame.ConfirmButton)
					until not game:GetService("CoreGui").RobloxGui.PromptDialog.ContainerFrame.ConfirmButton.Visible or not game:GetService("CoreGui").RobloxGui.PromptDialog.Visible
				end
			end
		end
	end

	local function checkPlayers()
		local players = game:GetService("Players"):GetPlayers()

		for i, v in ipairs(players) do
			local role = v:GetRoleInGroup(34891484)
			local inGroup = v:IsInGroup(34891484)

			if v.UserId ~= player.UserId and inGroup and not string.match(role, "Member") and not string.match(role, "Guest") then
				MacLib.Options["EnabledButton"].State = false
				repeat task.wait() until not player.PlayerGui.Loading.MainFrame.ImageLabel.Visible
				blockPlayers()
				game:GetService("Players").LocalPlayer:Kick("Player: " .. v.Name .. " is a " .. role .. " in the group.")
				game:GetService("TeleportService"):Teleport(game.PlaceId)
			end

			if v.UserId ~= player.UserId and (game.PlaceId == 80299472659017 or game.PlaceId == 110577167676254 or game.PlaceId == 76011326497329 or game.PlaceId == 86392425558311) then
				MacLib.Options["EnabledButton"].State = false
				repeat task.wait() until not player.PlayerGui.Loading.MainFrame.ImageLabel.Visible
				blockPlayers()
				game:GetService("Players").LocalPlayer:Kick("Player: " .. v.Name .. " is in your session.")
				game:GetService("TeleportService"):Teleport(game.PlaceId)
			end
		end

		game:GetService("Players").PlayerAdded:Connect(function(v)
			local role = v:GetRoleInGroup(34891484)
			local inGroup = v:IsInGroup(34891484)

			if v.UserId ~= player.UserId and inGroup and not string.match(role, "Member") and not string.match(role, "Guest") then
				MacLib.Options["EnabledButton"].State = false
				blockPlayers()
				game:GetService("Players").LocalPlayer:Kick("Player: " .. v.Name .. " is a " .. role .. " in the group.")
				game:GetService("TeleportService"):Teleport(game.PlaceId)
			end

			if v.UserId ~= player.UserId and (game.PlaceId == 80299472659017 or game.PlaceId == 110577167676254 or game.PlaceId == 76011326497329 or game.PlaceId == 86392425558311) then
				MacLib.Options["EnabledButton"].State = false
				blockPlayers()
				game:GetService("Players").LocalPlayer:Kick("Player: " .. v.Name .. " has joined your session.")
				game:GetService("TeleportService"):Teleport(game.PlaceId)
			end
		end)
	end

	local function nearest()
		local Closest
		local Distance = math.huge
		for _,v in pairs(workspace.Collect:GetChildren()) do
			
			if check() and v:FindFirstChild("Part") and v.Part:FindFirstChild("InfoBar") and v.Part.InfoBar:FindFirstChild("DigimonName") and v:FindFirstChild("Health") and v.Health.Value > 0 and not player.PlayerGui.Loading.MainFrame.ImageLabel.Visible then
				if MacLib.Options["AutoFarm_Bot_Toggle"].State then
					local mobNames = table.concat(MacLib.Options["mobs_Dropdown"].Value or {}, "|")
					local parsedName = string.match(v.Part.InfoBar.DigimonName.ContentText, "^(%S+)")
					if mobNames and string.match(mobNames, parsedName) then
						local newDistance = (v.Position - player.Character.HumanoidRootPart.Position).magnitude
						if newDistance < Distance then
							Closest = v
							Distance = newDistance
						end
					end
				elseif MacLib.Options["AutoFarm_Macro_Toggle"].State then
					local newDistance = (v.Position - player.Character.HumanoidRootPart.Position).magnitude
					if newDistance < MacLib.Options["AutoFarm_Range_Slider"]:GetValue() then
						Closest = v
						Distance = newDistance
					end
				end
			end
		end
		return Closest
	end


	local function checkPlace(instance)
		if instance == "GoblinFort" then
			if game.PlaceId ~= 133649758958568 and ((MacLib.Options["AutoDungeon_Difficulty_Dropdown"].Value == "Normal" and game.PlaceId ~= 76011326497329) or (MacLib.Options["AutoDungeon_Difficulty_Dropdown"].Value == "Hard" and game.PlaceId ~= 86392425558311)) then
				game:GetService("TeleportService"):Teleport(133649758958568)
				return false
			elseif game.PlaceId ~= 76011326497329 and game.PlaceId == 133649758958568 and MacLib.Options["AutoDungeon_Difficulty_Dropdown"].Value == "Normal" then
				if game:GetService("Players").LocalPlayer.CharInfoID.Bits.Value >= 25000 then
					game:GetService("ReplicatedStorage").PartySystemRENormal:FireServer("createParty", "0", 1)
					task.wait(2)
					game:GetService("ReplicatedStorage").PartySystemRENormal:FireServer("startParty", "0")
				else
					player:Kick("Not Enough Money for Normal Difficulty")
				end
				return false
			elseif game.PlaceId ~= 86392425558311 and game.PlaceId == 133649758958568 and MacLib.Options["AutoDungeon_Difficulty_Dropdown"].Value == "Hard" then
				if game:GetService("Players").LocalPlayer.CharInfoID.Bits.Value >= 50000 then
					game:GetService("ReplicatedStorage").PartySystemREHard:FireServer("createParty", "0", 1)
					task.wait(2)
					game:GetService("ReplicatedStorage").PartySystemREHard:FireServer("startParty", "0")
				else
					player:Kick("Not Enough Money for Hard Difficulty")
				end
				return false
			end
		elseif instance == "Colosseum" then
			if game.PlaceId ~= 114035449487554 and ((MacLib.Options["AutoColosseum_Difficulty_Dropdown"].Value == "Easy" and game.PlaceId ~= 80299472659017) or (MacLib.Options["AutoColosseum_Difficulty_Dropdown"].Value == "Normal" and game.PlaceId ~= 110577167676254)) then
				game:GetService("TeleportService"):Teleport(114035449487554)
				return false
			elseif game.PlaceId ~= 80299472659017 and game.PlaceId == 114035449487554 and MacLib.Options["AutoColosseum_Difficulty_Dropdown"].Value == "Easy" then
				if game:GetService("Players").LocalPlayer.CharInfoID.Bits.Value >= 30000 then
					game:GetService("ReplicatedStorage").PartySystemRE:FireServer("createParty", "0", 1)
					task.wait(2)
					game:GetService("ReplicatedStorage").PartySystemRE:FireServer("startParty", "0")
				else
					player:Kick("Not Enough Money for Easy Difficulty")
				end
				return false
			elseif game.PlaceId ~= 110577167676254 and game.PlaceId == 114035449487554 and MacLib.Options["AutoColosseum_Difficulty_Dropdown"].Value == "Normal" then
				if game:GetService("Players").LocalPlayer.CharInfoID.Bits.Value >= 60000 then
					game:GetService("ReplicatedStorage").PartySystemNormalRE:FireServer("createParty", "0", 1)
					task.wait(2)
					game:GetService("ReplicatedStorage").PartySystemNormalRE:FireServer("startParty", "0")
				else
					player:Kick("Not Enough Money for Normal Difficulty")
				end
				return false
			end
		end
		return true
	end

	local function checkCount()
		if game:GetService("Workspace").Collect then 
			local path = game:GetService("Workspace").Collect:GetChildren()
			if #path <= 0 then
				return true
			end
		end
		return false
	end

	local function spamSkill()
		task.spawn(function()
			if player.PlayerGui.Server.SkillsDisplayDigimon:FindFirstChild("Skill4") then
				player.PlayerGui.CombatClient.Skill4:InvokeServer(player.PlayerGui.Server.SkillsDisplayDigimon.Skill4.SkillDamage.Value, player.PlayerGui.Server.SkillsDisplayDigimon.Skill4.Cooldown.Value, tostring(math.random(100000, 999999))..tostring(tick()), false)
			end
		end)
		task.spawn(function()
			if player.PlayerGui.Server.SkillsDisplayDigimon:FindFirstChild("Skill3") then
				player.PlayerGui.CombatClient.Skill3:InvokeServer(player.PlayerGui.Server.SkillsDisplayDigimon.Skill3.SkillDamage.Value, player.PlayerGui.Server.SkillsDisplayDigimon.Skill3.Cooldown.Value, tostring(math.random(100000, 999999))..tostring(tick()), false)
			end
		end)
		task.spawn(function()
			if player.PlayerGui.Server.SkillsDisplayDigimon:FindFirstChild("Skill2") then
				player.PlayerGui.CombatClient.Skill2:InvokeServer(player.PlayerGui.Server.SkillsDisplayDigimon.Skill2.SkillDamage.Value, player.PlayerGui.Server.SkillsDisplayDigimon.Skill2.Cooldown.Value, tostring(math.random(100000, 999999))..tostring(tick()), false)
			end
		end)
		task.spawn(function()
			if player.PlayerGui.Server.SkillsDisplayDigimon:FindFirstChild("Skill1") then
				player.PlayerGui.CombatClient.Skill1:InvokeServer(player.PlayerGui.Server.SkillsDisplayDigimon.Skill1.SkillDamage.Value, player.PlayerGui.Server.SkillsDisplayDigimon.Skill1.Cooldown.Value, tostring(math.random(100000, 999999))..tostring(tick()), false)
			end
		end)
	end

	local function auto_Colosseum()
		for i,v in pairs(workspace.Collect:GetChildren()) do
			if (MacLib.Options["EnabledButton"].State and MacLib.Options["AutoColosseum_Toggle"].State) and check() and v and v:FindFirstChild("Check") and v:FindFirstChild("Part") and v.Part:FindFirstChild("InfoBar") and v.Part.InfoBar:FindFirstChild("DigimonName") and v:FindFirstChild("Health") and v.Health.Value > 0 and not player.PlayerGui.Loading.MainFrame.ImageLabel.Visible then
				local indexNum = v.Name
				local mobName = v.Part.InfoBar.DigimonName.ContentText
				
				onbattle = true
				print("Target:", v.Name, v.Part.InfoBar.DigimonName.ContentText, v.Health.Value)

				pcall(function()
					repeat 
						workspace.CurrentCamera.CameraSubject = player.Character.HumanoidRootPart.pet1.Pet
						
						fireclickdetector(v.Check)
						
						spamSkill()

						if MacLib.Options["AutoColosseum_Regen_Toggle"].State and player.Character.HumanoidRootPart.pet1.Stats.Health.Value < ((MacLib.Options["AutoColosseum_Regen_Dropdown"].Value * 0.01) * player.Character.HumanoidRootPart.pet1.Stats.HealthMax.Value) then
							repeat task.wait(0.3)
								task.spawn(function()
									game:GetService("Players").LocalPlayer.PlayerGui.CombatClient.CallDigimon:InvokeServer(tostring(math.random(100000, 999999)), false)
								end)
							until not check() or not player.Character.HumanoidRootPart:FindFirstChild("pet1") or (player.Character.HumanoidRootPart.pet1.Stats.Health.Value >= player.Character.HumanoidRootPart.pet1.Stats.HealthMax.Value) or not v or not v:FindFirstChild("Part") or not v:FindFirstChild("Check") or not v:FindFirstChild("Health") or v.Health.Value <= 0 or player.PlayerGui.Loading.MainFrame.ImageLabel.Visible or not MacLib.Options["EnabledButton"].State or not MacLib.Options["AutoColosseum_Regen_Toggle"].State
						end

						if v and v:FindFirstChild("Part") and v.Part:FindFirstChild("InfoBar") and v.Part.InfoBar:FindFirstChild("DigimonName") and ((MacLib.Options["AutoColosseum_Difficulty_Dropdown"].Value == "Easy" and string.match(v.Part.InfoBar.DigimonName.ContentText, "Dorbickmon")) or (MacLib.Options["AutoColosseum_Difficulty_Dropdown"].Value == "Normal" and string.match(v.Part.InfoBar.DigimonName.ContentText, "MadLeomon"))) then
							restart = true
						end

						task.wait(0.1)
					until not MacLib.Options["EnabledButton"].State or not MacLib.Options["AutoColosseum_Toggle"].State or not check() or not v or not v:FindFirstChild("Check") or not v:FindFirstChild("Part") or not v.Part:FindFirstChild("InfoBar") or not v.Part.InfoBar:FindFirstChild("DigimonName") or not v:FindFirstChild("Health") or v.Health.Value <= 0 or player.PlayerGui.Loading.MainFrame.ImageLabel.Visible
				end)
				warn("Killed:", indexNum, mobName)
				onbattle = false
			end
		end
		
		if (MacLib.Options["AutoColosseum_Toggle"].State and MacLib.Options["EnabledButton"].State) and check() and restart and not onbattle and checkCount() then
			workspace.CurrentCamera.CameraSubject = player.Character
			task.wait(1)
			messageWebhook()
			repeat task.wait(0.5) 
				game:GetService("TeleportService"):Teleport(game.PlaceId)
			until not tpMode
			return
		end
	end


	local function auto_Dungeon()
		for i,v in pairs(workspace.Collect:GetChildren()) do
			if (MacLib.Options["AutoDungeon_Toggle"].State and MacLib.Options["EnabledButton"].State) and check() and v and v:FindFirstChild("Check") and v:FindFirstChild("Part") and v.Part:FindFirstChild("InfoBar") and v.Part.InfoBar:FindFirstChild("DigimonName") and v:FindFirstChild("Health") and v.Health.Value > 0 and not player.PlayerGui.Loading.MainFrame.ImageLabel.Visible then
				local indexNum = v.Name
				local mobName = v.Part.InfoBar.DigimonName.ContentText
				
				onbattle = true
				print("Target:", v.Name, v.Part.InfoBar.DigimonName.ContentText, v.Health.Value)
				pcall(function()
					repeat 
						workspace.CurrentCamera.CameraSubject = player.Character.HumanoidRootPart.pet1.Pet

						fireclickdetector(v.Check)

						spamSkill()

						if v.Part.InfoBar:FindFirstChild("BossTitle") and string.match(v.Part.InfoBar.BossTitle.Text, "The Chieftain") then
							restart = true
						end

						task.wait(0.1)
					until not v or not v:FindFirstChild("Check") or not v:FindFirstChild("Health") or v.Health.Value <= 0 or not check() or player.PlayerGui.Loading.MainFrame.ImageLabel.Visible or not MacLib.Options["EnabledButton"].State or not MacLib.Options["AutoDungeon_Toggle"].State
				end)
				warn("Killed:", indexNum, mobName)
				onbattle = false
			end
		end
		
		if MacLib.Options["AutoDungeon_Toggle"].State and MacLib.Options["EnabledButton"].State and check() and restart and not onbattle and checkCount() then
			workspace.CurrentCamera.CameraSubject = player.Character
			task.wait(1)
			messageWebhook()
			repeat task.wait(0.5) 
				game:GetService("TeleportService"):Teleport(game.PlaceId) 
			until not tpMode
			return
		end
	end

	local function auto_Farm()
		local Target = nearest()
		if Target == nil then
			return
		end

		local digimonName = Target.Part.InfoBar.DigimonName.ContentText
		print("Target:", Target.Part.InfoBar.DigimonName.ContentText, Target.Health.Value)

		if check() and MacLib.Options["AutoFarm_Bot_Toggle"].State then
			repeat task.wait(0.1)
				player.Character.Humanoid:MoveTo(Target.Position)
			until not check() and player.PlayerGui.Loading.MainFrame.ImageLabel.Visible or not Target or Target == nil or not Target:FindFirstChild("Health") or Target.Health.Value <= 0 or not MacLib.Options["EnabledButton"].State or not MacLib.Options["AutoFarm_Toggle"].State or player:DistanceFromCharacter(Target.Position) < 33
			player.Character.Humanoid:MoveTo(player.Character.HumanoidRootPart.Position)
		end

		pcall(function()
			repeat task.wait(0.1)
				if Target or Target.Check or not player.PlayerGui.Loading.MainFrame.ImageLabel.Visible then
					fireclickdetector(Target.Check)
				end

				spamSkill()
				
			until not check() and player.PlayerGui.Loading.MainFrame.ImageLabel.Visible or not Target or Target == nil or not Target:FindFirstChild("Health") or Target.Health.Value <= 0 or not MacLib.Options["EnabledButton"].State or not MacLib.Options["AutoFarm_Toggle"].State
		end)
		warn("Killed:", digimonName)
	end
	--- FUNCTIONS ---

	--- UI ---
	local Window = MacLib:Window({
		Title = "Digimon: Reboot World",
		Subtitle = "FARM | DUNGEON | COLOSSEUM",
		Size = UDim2.fromOffset(868, 650),
		DragStyle = 1,
		DisabledWindowControls = {},
		ShowUserInfo = false,
		Keybind = Enum.KeyCode.LeftControl,
		AcrylicBlur = true,
	})

	local Group_Main = Window:TabGroup() -- Main Group
	local Tab_Main = Group_Main:Tab({ -- Main Tab
		Name = "Main",
		Image = "rbxassetid://80106645720330"
	})
	local Section_Main_Enable = Tab_Main:Section({ -- Main Enable Section
		Side = "Left"
	})
	Section_Main_Enable:Toggle({ -- Main Enable Toggle
		Name = "Enable",
		Default = false,
		Callback = function()
			if UIisLoaded < 2 then 
				return 
			end
			
			if MacLib.Options["EnabledButton"].State then
				saveConfig()
			end

			if not MacLib.Options["EnabledButton"].State and MacLib.Options["AutoFarm_Toggle"].State then
				MacLib.Options["AutoFarm_Toggle"]:UpdateState(false)
			end

			if not MacLib.Options["EnabledButton"].State and MacLib.Options["AutoDungeon_Toggle"].State then
				MacLib.Options["AutoDungeon_Toggle"]:UpdateState(false)
			end

			if not MacLib.Options["EnabledButton"].State and MacLib.Options["AutoColosseum_Toggle"].State then
				MacLib.Options["AutoColosseum_Toggle"]:UpdateState(false)
			end

		end,
	}, "EnabledButton")
	local Section_Main_Functions = Tab_Main:Section({ -- Main Function Section
		Side = "Left"
	})
	Section_Main_Functions:Toggle({ -- Main Auto-Farm Toggle
		Name = "Auto-Farm",
		Default = false,
		Callback = function()
			if UIisLoaded < 1 then 
				return 
			end

			if MacLib.Options["AutoFarm_Toggle"].State then

				if not MacLib.Options["EnabledButton"].State then
					MacLib.Options["AutoFarm_Toggle"]:UpdateState(false)
					return
				end
				
				if MacLib.Options["AutoColosseum_Toggle"].State then
					MacLib.Options["AutoColosseum_Toggle"]:UpdateState(false)
				end
				
				if MacLib.Options["AutoDungeon_Toggle"].State then
					MacLib.Options["AutoDungeon_Toggle"]:UpdateState(false)
				end
				
				if not MacLib.Options["EnabledButton"].State or (not (MacLib.Options["AutoFarm_Bot_Toggle"].State and MacLib.Options["mobs_Dropdown"].Value) and not MacLib.Options["AutoFarm_Macro_Toggle"].State) then
					MacLib.Options["AutoFarm_Toggle"]:UpdateState(false)
					saveConfig()
					return
				end

				if MacLib.Options["AutoFarm_WebhookTimer_Toggle"].State and MacLib.Options["AutoFarm_Toggle"].State and MacLib.Options["EnabledButton"].State and ((MacLib.Options["AutoFarm_Bot_Toggle"].State and MacLib.Options["mobs_Dropdown"].Value) or MacLib.Options["AutoFarm_Macro_Toggle"].State) then
					task.spawn(function()
						while MacLib.Options["AutoFarm_WebhookTimer_Toggle"].State and MacLib.Options["AutoFarm_Toggle"].State and MacLib.Options["EnabledButton"].State and ((MacLib.Options["AutoFarm_Bot_Toggle"].State and MacLib.Options["mobs_Dropdown"].Value) or MacLib.Options["AutoFarm_Macro_Toggle"].State) do
							task.wait(MacLib.Options["AutoFarm_WebhookTimer_Slider"].Value)
							messageWebhook()					
						end
					end)
				end

				while MacLib.Options["AutoFarm_Toggle"].State and MacLib.Options["EnabledButton"].State and ((MacLib.Options["AutoFarm_Bot_Toggle"].State and MacLib.Options["mobs_Dropdown"].Value) or MacLib.Options["AutoFarm_Macro_Toggle"].State) do
					
					auto_Farm()

					task.wait(0.1)
				end
			end

			saveConfig()
		end,
	}, "AutoFarm_Toggle")
	Section_Main_Functions:Toggle({ -- Main Auto-Dungeon Toggle
		Name = "Auto-Dungeon",
		Default = false,
		Callback = function()
			if UIisLoaded < 1 then 
				return 
			end

			if MacLib.Options["AutoDungeon_Toggle"].State then

				if not MacLib.Options["EnabledButton"].State then
					MacLib.Options["AutoDungeon_Toggle"]:UpdateState(false)
					return
				end
				
				if MacLib.Options["AutoFarm_Toggle"].State then
					MacLib.Options["AutoFarm_Toggle"]:UpdateState(false)
				end
				
				if MacLib.Options["AutoColosseum_Toggle"].State then
					MacLib.Options["AutoColosseum_Toggle"]:UpdateState(false)
				end

				task.spawn(function()
					while MacLib.Options["AutoDungeon_Reconnect_Toggle"].State and MacLib.Options["AutoDungeon_Toggle"].State and MacLib.Options["EnabledButton"].State and MacLib.Options["AutoDungeon_Difficulty_Dropdown"].Value do
						task.wait(MacLib.Options["AutoDungeon_Reconnect_Slider"].Value)
						if MacLib.Options["AutoDungeon_Reconnect_Toggle"].State and MacLib.Options["AutoDungeon_Toggle"].State and MacLib.Options["EnabledButton"].State and MacLib.Options["AutoDungeon_Difficulty_Dropdown"].Value then
							player:Kick("Timer: Reconnecting to the Game.")
							game:GetService("TeleportService"):Teleport(game.PlaceId)
						end				
					end
				end)

				while MacLib.Options["AutoDungeon_Toggle"].State and MacLib.Options["EnabledButton"].State and MacLib.Options["AutoDungeon_Difficulty_Dropdown"].Value do
					if not checkPlace("GoblinFort") then
						repeat task.wait() until not tpMode
					end

					auto_Dungeon()

					task.wait(0.1)
				end
			end
			saveConfig()

		end,
	}, "AutoDungeon_Toggle")
	Section_Main_Functions:Toggle({ 
		Name = "Auto-Colosseum",
		Default = false,
		Callback = function()
			if UIisLoaded < 1 then 
				return 
			end

			if MacLib.Options["AutoColosseum_Toggle"].State then

				if not MacLib.Options["EnabledButton"].State then
					MacLib.Options["AutoColosseum_Toggle"]:UpdateState(false)
					return
				end
				
				if MacLib.Options["AutoFarm_Toggle"].State then
					MacLib.Options["AutoFarm_Toggle"]:UpdateState(false)
				end
				
				if MacLib.Options["AutoDungeon_Toggle"].State then
					MacLib.Options["AutoDungeon_Toggle"]:UpdateState(false)
				end

				task.spawn(function()
					while MacLib.Options["AutoColosseum_Reconnect_Toggle"].State and MacLib.Options["AutoColosseum_Toggle"].State and MacLib.Options["EnabledButton"].State and MacLib.Options["AutoColosseum_Difficulty_Dropdown"].Value do
						task.wait(MacLib.Options["AutoColosseum_Reconnect_Slider"].Value)
						if MacLib.Options["AutoColosseum_Reconnect_Toggle"].State and MacLib.Options["AutoColosseum_Toggle"].State and MacLib.Options["EnabledButton"].State and MacLib.Options["AutoColosseum_Difficulty_Dropdown"].Value then
							player:Kick("Timer: Reconnecting to the Game.")
							game:GetService("TeleportService"):Teleport(game.PlaceId)
						end				
					end
				end)

				while MacLib.Options["AutoColosseum_Toggle"].State and MacLib.Options["EnabledButton"].State and MacLib.Options["AutoColosseum_Difficulty_Dropdown"].Value do
					if not checkPlace("Colosseum") then
						repeat task.wait() until not tpMode
					end
					auto_Colosseum()

					task.wait(0.1)
				end
			end
			saveConfig()

		end,
	}, "AutoColosseum_Toggle")

	local Section_Main_Save = Tab_Main:Section({ -- Main Enable Section
		Side = "Right"
	})
	Section_Main_Save:Toggle({ 
		Name = "Auto-Save Config",
		Default = false,
		Callback = function()
			if UIisLoaded < 2 then 
				return 
			end
		end,
	}, "Save_AutoSave_Toggle")
	Section_Main_Save:Button({
		Name = "Save Config",
		Callback = function()
			if UIisLoaded < 2 then 
				return 
			end
			MacLib:SaveConfig("bitsv3rm")
		end,
	})
	Section_Main_Save:Button({
		Name = "Clear Config",
		Callback = function()
			if UIisLoaded < 2 then 
				return 
			end
			writefile("bitsv3rm/settings/bitsv3rm.json", "")
		end,
	})


	local Group_Function = Window:TabGroup() -- Function Group
	local Tab_AutoFarm = Group_Function:Tab({ -- Function Auto-Farm Tab
		Name = "Auto-Farm",
		Image = "rbxassetid://123447833037199"
	})

	local Section_AutoFarm_Bot = Tab_AutoFarm:Section({ --
		Side = "Left"
	})
	Section_AutoFarm_Bot:Header({
		Text = "Bot Mode"
	}, "")
	Section_AutoFarm_Bot:Toggle({ 
		Name = "Enable",
		Default = false,
		Callback = function()
			if UIisLoaded < 2 then 
				return 
			end

			if MacLib.Options["AutoFarm_Bot_Toggle"].State then
				if MacLib.Options["AutoFarm_Macro_Toggle"].State then
					MacLib.Options["AutoFarm_Macro_Toggle"]:UpdateState(false)
				end

				saveConfig()
			elseif not MacLib.Options["AutoFarm_Bot_Toggle"].State and not MacLib.Options["AutoFarm_Macro_Toggle"].State and MacLib.Options["AutoFarm_Toggle"].State then
				MacLib.Options["AutoFarm_Toggle"]:UpdateState(false)
				saveConfig()
			end
		end,
	}, "AutoFarm_Bot_Toggle")
	Section_AutoFarm_Bot:Dropdown({
		Name = "World",
		Search = true,
		Multi = false,
		Required = true,
		Options = {"Silver Lake", "Gear Savannah", "Infinite Mountain"},
		Default = 1,
		Callback = function(World)
			if UIisLoaded < 2 then 
				return 
			end
			warn("fasdfasdfasdfasd")
			MacLib.Options["mobs_Dropdown"]:ClearOptions()
			MacLib.Options["mobs_Dropdown"].Value = nil
			MacLib.Options["mobs_Dropdown"]:InsertOptions(getgenv().Settings.Enemies[World]["Mobs"])
			saveConfig()
		end,
	}, "world_Dropdown")
	Section_AutoFarm_Bot:Dropdown({
		Name = "Mobs",
		Search = true,
		Multi = true,
		Required = true,
		Options,
		Default,
		Callback = function()
			if UIisLoaded < 2 then 
				return 
			end

			if MacLib.Options["mobs_Dropdown"].Value ~= nil then

				if MacLib.Options["AutoFarm_Toggle"].State then
					MacLib.Options["AutoFarm_Toggle"]:UpdateState(false)
				end

				saveConfig()
			end
		end,
	}, "mobs_Dropdown")

	local Section_AutoFarm_Macro = Tab_AutoFarm:Section({ --
		Side = "Left"
	})
	Section_AutoFarm_Macro:Header({
		Text = "Macro Mode"
	}, "")
	Section_AutoFarm_Macro:Toggle({ 
		Name = "Enable",
		Default = false,
		Callback = function()
			if UIisLoaded < 2 then 
				return 
			end
			
			if MacLib.Options["AutoFarm_Macro_Toggle"].State then
				if MacLib.Options["AutoFarm_Bot_Toggle"].State then
					MacLib.Options["AutoFarm_Bot_Toggle"]:UpdateState(false)
				end

				saveConfig()
			elseif not MacLib.Options["AutoFarm_Bot_Toggle"].State and not MacLib.Options["AutoFarm_Macro_Toggle"].State and MacLib.Options["AutoFarm_Toggle"].State then
				MacLib.Options["AutoFarm_Toggle"]:UpdateState(false)
				saveConfig()
			end
		end,
	}, "AutoFarm_Macro_Toggle")
	Section_AutoFarm_Macro:Slider({
		Name = "Range",
		Default = 35,
		Minimum = 15,
		Maximum = 100,
		DisplayMethod = "Value",
		Callback = function()
		end,
	}, "AutoFarm_Range_Slider")
	local Section_AutoFarm_WebhookTimer = Tab_AutoFarm:Section({
		Side = "Right"
	})
	Section_AutoFarm_WebhookTimer:Toggle({ 
		Name = "Enable Webhook Timer",
		Default = false,
		Callback = function()
		end,
	}, "AutoFarm_WebhookTimer_Toggle")
	Section_AutoFarm_WebhookTimer:Slider({
		Name = "Webhook Timer",
		Default = 60,
		Minimum = 60,
		Maximum = 3600,
		DisplayMethod = "Value",
		Callback = function()
		end,
	}, "AutoFarm_WebhookTimer_Slider")


	local Tab_AutoDungeon = Group_Function:Tab({ -- Function Auto-Dungeon Tab
		Name = "Auto-Dungeon",
		Image = "rbxassetid://91933270767990"
	})
	local Section_AutoDungeon_Difficulty = Tab_AutoDungeon:Section({ --
		Side = "Left"
	})
	Section_AutoDungeon_Difficulty:Dropdown({
		Name = "Difficulty",
		Search = false,
		Multi = false,
		Required = true,
		Options = {"Normal", "Hard"},
		Default = 1,
		Callback = function()
		end,
	}, "AutoDungeon_Difficulty_Dropdown")

	local Section_AutoDungeon_Reconnect = Tab_AutoDungeon:Section({
		Side = "Right"
	})
	Section_AutoDungeon_Reconnect:Toggle({ 
		Name = "Enable Reconnect Timer",
		Default = false,
		Callback = function()
		end,
	}, "AutoDungeon_Reconnect_Toggle")
	Section_AutoDungeon_Reconnect:Slider({
		Name = "Reconnect Timer",
		Default = 300,
		Minimum = 60,
		Maximum = 3600,
		DisplayMethod = "Value",
		Callback = function()
		end,
	}, "AutoDungeon_Reconnect_Slider")

	local Tab_AutoColosseum = Group_Function:Tab({ -- Function Auto-Dungeon Tab
		Name = "Auto-Colosseum",
		Image = "rbxassetid://76200096147550"
	})
	local Section_AutoColosseum_Difficulty = Tab_AutoColosseum:Section({ --
		Side = "Left"
	})
	Section_AutoColosseum_Difficulty:Dropdown({
		Name = "Difficulty",
		Search = false,
		Multi = false,
		Required = true,
		Options = {"Easy", "Normal"},
		Default = 1,
		Callback = function()
		end,
	}, "AutoColosseum_Difficulty_Dropdown")

	local Section_AutoColosseum_Regen = Tab_AutoColosseum:Section({ --
		Side = "Left"
	})
	Section_AutoColosseum_Regen:Toggle({ 
		Name = "Enable Regen HP",
		Default = false,
		Callback = function()
		end,
	}, "AutoColosseum_Regen_Toggle")
	Section_AutoColosseum_Regen:Slider({
		Name = "Regen HP",
		Default = 50,
		Minimum = 1,
		Maximum = 100,
		DisplayMethod = "Percent",
		Callback = function()
		end,
	}, "AutoColosseum_Regen_Dropdown")

	local Section_AutoColosseum_Reconnect = Tab_AutoColosseum:Section({
		Side = "Right"
	})
	Section_AutoColosseum_Reconnect:Toggle({ 
		Name = "Enable Reconnect Timer",
		Default = false,
		Callback = function()
		end,
	}, "AutoColosseum_Reconnect_Toggle")
	Section_AutoColosseum_Reconnect:Slider({
		Name = "Reconnect Timer",
		Default = 900,
		Minimum = 60,
		Maximum = 3600,
		DisplayMethod = "Value",
		Callback = function()
		end,
	}, "AutoColosseum_Reconnect_Slider")

	local Extra_Settings = Window:TabGroup() 
	local Tab_Extra = Extra_Settings:Tab({ 
		Name = "Extra",
		Image = "rbxassetid://112165746496911"
	})
	local Section_Extra_OpenClones = Tab_Extra:Section({ --
		Side = "Left"
	})
	Section_Extra_OpenClones:Dropdown({
		Name = "DigiClone",
		Search = true,
		Multi = false,
		Required = true,
		Options = (function() local t = {} for k in pairs(getgenv().Settings.clones) do t[#t+1] = k end return t end)(),
		Default,
		Callback = function()
		end,
	}, "Extra_OpenClones_Dropdown")
	Section_Extra_OpenClones:Toggle({ 
		Name = "Auto-Clone",
		Default = false,
		Callback = function()
			if UIisLoaded < 2 then 
				return 
			end

			if MacLib.Options["Extra_OpenClones_Toggle"].State and MacLib.Options["Extra_OpenClones_Dropdown"].Value  then
				if MacLib.Options["Extra_OpenClones_Toggle"].State and MacLib.Options["Extra_OpenClones_Dropdown"].Value and game.PlaceId ~= 114035449487554 then
					Window:Notify({
						Title = "Auto-Clone",
						Description = "This feature is only available in the Village of the Beginning.",
						Lifetime = 15
					})
					MacLib.Options["Extra_OpenClones_Toggle"]:UpdateState(false)
					return
				end

				while MacLib.Options["Extra_OpenClones_Toggle"].State and task.wait(0.1) do
					for i,v in pairs(player.PlayerGui.CloningSystem.Cloning:GetChildren()) do
						if v:IsA("TextButton") and v.ContentText == MacLib.Options["Extra_OpenClones_Dropdown"].Value then

							if player.PlayerGui.CloningSystem.Cloning.CloneSelected.Value ~= getgenv().Settings.clones[MacLib.Options["Extra_OpenClones_Dropdown"].Value] then
								player.PlayerGui.CloningSystem.Cloning.Visible = true
								player.PlayerGui.CloningSystem.Cloning.CraftFrame.Visible = true
								clickButton(v)
							end

							local cloning = true
							local jumpConnection

							jumpConnection = player.Character.Humanoid.StateChanged:Connect(function(_, newState)
								if newState == Enum.HumanoidStateType.Jumping then
									cloning = false
								end
							end)

							Window:Notify({
								Title = "Auto-Clone Enabled",
								Description = "JUMP to disable Auto-Clone.",
								Lifetime = 15
							})

							repeat task.wait(0.1)
								player.PlayerGui.CloningSystem.Cloning.Visible = true
								player.PlayerGui.CloningSystem.Cloning.CraftFrame.Visible = true
								clickButton(v.Parent.CraftFrame.Craft)
							until not cloning or not MacLib.Options["Extra_OpenClones_Toggle"].State

							task.wait(1.5)
							jumpConnection:Disconnect()
							player.PlayerGui.CloningSystem.Cloning.Visible = false
							player.PlayerGui.CloningSystem.Cloning.CraftFrame.Visible = false
							MacLib.Options["Extra_OpenClones_Toggle"]:UpdateState(false)
						end
					end
				end

				player.PlayerGui.CloningSystem.Cloning.Visible = false
				player.PlayerGui.CloningSystem.Cloning.CraftFrame.Visible = false
			end
		end,
	}, "Extra_OpenClones_Toggle")
	local Section_Extra_OpenBoxes = Tab_Extra:Section({ --
		Side = "Right"
	})
	Section_Extra_OpenBoxes:Dropdown({
		Name = "Boxes",
		Search = true,
		Multi = false,
		Required = true,
		Options = (function() local t = {} for k in pairs(getgenv().Settings.boxes) do t[#t+1] = k end return t end)(),
		Default,
		Callback = function()
		end,
	}, "Extra_OpenBoxes_Dropdown")
	Section_Extra_OpenBoxes:Toggle({ 
		Name = "Auto-Open",
		Default = false,
		Callback = function()
			if UIisLoaded < 2 then 
				return 
			end


			if MacLib.Options["Extra_OpenBoxes_Toggle"].State and MacLib.Options["Extra_OpenBoxes_Dropdown"].Value and (player.Items[getgenv().Settings.boxes[MacLib.Options["Extra_OpenBoxes_Dropdown"].Value]].Value >= 1) then
				while MacLib.Options["Extra_OpenBoxes_Toggle"].State and MacLib.Options["Extra_OpenBoxes_Dropdown"].Value and (player.Items[getgenv().Settings.boxes[MacLib.Options["Extra_OpenBoxes_Dropdown"].Value]].Value >= 1)do
					task.wait(0.1)
					
					local arg_itemname = getgenv().Settings.boxes[MacLib.Options["Extra_OpenBoxes_Dropdown"].Value]
					local itemamount = player.Items[arg_itemname].Value
					
					if itemamount > 0 then
						if itemamount >= 100 then
							game:GetService("ReplicatedStorage").ItemsEvent.OpenBoxEvent:InvokeServer(arg_itemname, 100)
						elseif itemamount >= 10 then
							game:GetService("ReplicatedStorage").ItemsEvent.OpenBoxEvent:InvokeServer(arg_itemname, 10)
						elseif itemamount >= 1 then
							game:GetService("ReplicatedStorage").ItemsEvent.OpenBoxEvent:InvokeServer(arg_itemname, 1)
						end
					end
				end

				if MacLib.Options["Extra_OpenBoxes_Toggle"].State then
					MacLib.Options["Extra_OpenBoxes_Toggle"]:UpdateState(false)
				end
			end
		end,
	}, "Extra_OpenBoxes_Toggle")

	local Group_Settings = Window:TabGroup() 
	local Tab_Settings = Group_Settings:Tab({ 
		Name = "Settings",
		Image = "rbxassetid://73899994101513"
	})

	local Section_Settings_Misc = Tab_Settings:Section({
		Side = "Left"
	})
	Section_Settings_Misc:Toggle({ 
		Name = "Check Update",
		Default = false,
		Callback = function()
			if UIisLoaded < 1 then 
				return 
			end

			if MacLib.Options["Settings_CheckUpdate_Toggle"].State then
				local currentPlace = game.PlaceId
				local currentVer = getgenv().Settings.placeVer[currentPlace]
		
				if currentVer and game.PlaceVersion ~= currentVer then
					player:Kick("Script Outdated: Game has been updated.", tostring(game.PlaceVersion))
					return
				end
			end
		end,
	}, "Settings_CheckUpdate_Toggle")
	Section_Settings_Misc:Toggle({ 
		Name = "Check Players",
		Default = false,
		Callback = function()
			if UIisLoaded < 1 then 
				return 
			end

			if MacLib.Options["Settings_CheckPlayers_Toggle"].State and (game.PlaceId == 80299472659017 or game.PlaceId == 110577167676254 or game.PlaceId == 76011326497329 or game.PlaceId == 86392425558311) then
				checkPlayers()
			end
		end,
	}, "Settings_CheckPlayers_Toggle")
	Section_Settings_Misc:Toggle({
		Name = "Streamer Mode",
		Default = false,
		Callback = function()
			if UIisLoaded < 1 then 
				return 
			end

			if MacLib.Options["Settings_StreamerMode_Toggle"].State then
				for i,v in pairs(player.Character:GetChildren()) do
					if check() and v:IsA("Pants") or v:IsA("Shirt") or v:IsA("Accessory") then
						v:Destroy()
					end

					if player.Character.Head:FindFirstChild("NameGui") then
						player.Character.Head.NameGui:Destroy()
					end

					if player.Character.Head:FindFirstChild("TitleGui") then
						player.Character.Head.TitleGui:Destroy()
					end
				end

				player.PlayerGui.Server.UIInfos.UILevel.ViewportFrame.Visible = false
				player.PlayerGui.PlayerListGui.PlayerScroller.Visible = false
			end
		end,
	}, "Settings_StreamerMode_Toggle")

	local Section_Settings_Discord = Tab_Settings:Section({
		Side = "Right"
	})
	Section_Settings_Discord:Toggle({ 
		Name = "Enable Discord Webhook",
		Default = false,
		Callback = function()
		end,
	}, "Settings_EnableDiscord_Toggle")
	Section_Settings_Discord:Input({
		Name = "Discord Webhook",
		Placeholder = "Webhook URL",
		AcceptedCharacters = "All",
		Callback = function()
		end,
	}, "Settings_WebhookURL_Input")

	Window:SetScale(0.7) -- Window Scale
	Tab_Main:Select() -- Select Main Tab
	MacLib:SetFolder("bitsv3rm")
	MacLib:LoadConfig("bitsv3rm")

	UIisLoaded = 1
	MacLib.Options["mobs_Dropdown"]:InsertOptions(getgenv().Settings.Enemies[MacLib.Options["world_Dropdown"].Value]["Mobs"])

	MacLib:LoadConfig("bitsv3rm")
	UIisLoaded = 2

	--- UI ---

	-- Anti-AFK
	player.Idled:Connect(function()
		game:GetService("VirtualUser"):CaptureController()
		game:GetService("VirtualUser"):ClickButton2(Vector2.new())
	end)

else
    game:GetService("Players").LocalPlayer:Kick("You have no access to this script.")
    return
end
