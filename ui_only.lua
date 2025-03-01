-- loadstring(game:HttpGet("https://raw.githubusercontent.com/BitsV3rm/rblx_ui/refs/heads/main/ui_only.lua"))()
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
        [133649758958568] = 2389,  -- Silver Lake
        [92975923292118] = 865,    -- Gear Savannah
        [138083468820287] = 702,   -- Infinite Mountain
        [80299472659017] = 894,    -- Colosseum_Easy
        [76011326497329] = 243,    -- GoblinFort_Normal
        [86392425558311] = 201     -- GoblinFort_Hard
    },
	placeId = {
		["Silver Lake"] = 133649758958568,  -- Silver Lake
        ["Gear Savannah"] = 92975923292118,    -- Gear Savannah
        ["Infinite Mountain"] = 138083468820287,   -- Infinite Mountain
        ["Colosseum_Easy"] = 80299472659017,    -- Colosseum_Easy
        ["GoblinFort_Normal"] = 76011326497329,    -- GoblinFort_Normal
        ["GoblinFort_Hard"] = 86392425558311     -- GoblinFort_Hard
	},
	Maps = {
        ["Silver Lake"] = Vector3.new(-60.7276, -363.8864, -203.6405),
        ["Gear Savannah"] = Vector3.new(-980.0617065429688, -459.4217834472656, 610.3125610351562),
        ["Infinite Mountain"] = Vector3.new(-626.793212890625, -21.54945182800293, 898.1337280273438)
    }
}


local MacLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/BitsV3rm/rblx_ui/refs/heads/main/maclib.txt"))()
local player = game:GetService("Players").LocalPlayer
local UIisLoaded = 0

-- Anti-Cheat Disabled
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
task.spawn(function()
    while task.wait(0.1) do
        pcall(function()
            player.PlayerScripts.ClientSide:Destroy()
            player.PlayerScripts.Monitor:Destroy()
            player.PlayerScripts.RemoteDetect:Destroy()
            player.PlayerGui.Key:Destroy()
            player.PlayerGui.AntiCheat:Destroy()
        end)
    end
end)

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

local function auto_Dungeon()
	local restart
	local onbattle

	for i,v in pairs(workspace.Collect:GetChildren()) do
		if getgenv().Settings.Enabled and check() and v and v:FindFirstChild("Check") and v:FindFirstChild("Part") and v.Part:FindFirstChild("InfoBar") and v.Part.InfoBar:FindFirstChild("DigimonName") and v:FindFirstChild("Health") and v.Health.Value > 0 and not player.PlayerGui.Loading.MainFrame.ImageLabel.Visible then
			local indexNum = v.Name
			local mobName = v.Part.InfoBar.DigimonName.ContentText
			
			onbattle = true
			print("Target:", v.Name, v.Part.InfoBar.DigimonName.ContentText, v.Health.Value)
			pcall(function()
				repeat 
					if player.Character.HumanoidRootPart:FindFirstChild("pet1") then
						workspace.CurrentCamera.CameraSubject = player.Character.HumanoidRootPart.pet1.Pet
					end
					if check() or not player.PlayerGui.Loading.MainFrame.ImageLabel.Visible then
						fireclickdetector(v.Check)
					end
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
	workspace.CurrentCamera.CameraSubject = player.Character
	
	if check() and restart and not onbattle and checkCount() then
		task.wait(1)
		--messageWebhook()
		game:GetService("TeleportService"):Teleport(game.PlaceId)
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
		repeat task.wait() until UIisLoaded == 2
		
		if MacLib.Options["AutoFarm_Toggle"].State then
            print("af-toggle-1")

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
				print("af-toggle-3")
                MacLib.Options["AutoFarm_Toggle"]:UpdateState(false)
				saveConfig()
				return
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
		repeat task.wait() until UIisLoaded == 2

		if MacLib.Options["AutoDungeon_Toggle"].State then
            print("ad-toggle-1")

            if not MacLib.Options["EnabledButton"].State then
                MacLib.Options["AutoDungeon_Toggle"]:UpdateState(false)
				print("returned 1")
                return
            end
            
            if MacLib.Options["AutoFarm_Toggle"].State then
                MacLib.Options["AutoFarm_Toggle"]:UpdateState(false)
            end
            
            if MacLib.Options["AutoColosseum_Toggle"].State then
                MacLib.Options["AutoColosseum_Toggle"]:UpdateState(false)
            end
			print(MacLib.Options["AutoDungeon_Toggle"].State, MacLib.Options["EnabledButton"].State, MacLib.Options["AutoDungeon_Difficulty_Dropdown"].Value)
            while MacLib.Options["AutoDungeon_Toggle"].State and MacLib.Options["EnabledButton"].State and MacLib.Options["AutoDungeon_Difficulty_Dropdown"].Value do
				print("1")
                if not checkPlace("GoblinFort") then
					print("returned 2")
					return
				end
				print("2")
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
		repeat task.wait() until UIisLoaded == 2

		if MacLib.Options["AutoColosseum_Toggle"].State then
            print("ac-toggle-1")

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

            while MacLib.Options["AutoColosseum_Toggle"].State and MacLib.Options["EnabledButton"].State and MacLib.Options["AutoColosseum_Difficulty_Dropdown"].Value do
                --Colosseum Farm
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

			saveConfig()
		end
	end,
}, "mobs_Dropdown")

local Section_AutoFarm_Macro = Tab_AutoFarm:Section({ --
    Side = "Right"
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
		repeat task.wait() until UIisLoaded == 2
	end,
}, "AutoFarm_Range_Slider")

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
	Name = "Webhook Timer",
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
	Name = "Webhook Timer",
	Default = 300,
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
	Search = false,
	Multi = false,
	Required = true,
	Options = {"Attack", "Defense", "Attack Speed", "HP", "Critical", "Regeneration"},
	Default,
	Callback = function()
	end,
}, "Extra_OpenClones_Dropdown")
Section_Extra_OpenClones:Toggle({ 
	Name = "Auto-Clone",
	Default = false,
	Callback = function()
	end,
}, "Extra_OpenClones_Toggle")
local Section_Extra_OpenBoxes = Tab_Extra:Section({ --
    Side = "Right"
})
Section_Extra_OpenBoxes:Dropdown({
	Name = "Boxes",
	Search = false,
	Multi = false,
	Required = true,
	Options = {},
	Default,
	Callback = function()
	end,
}, "Extra_OpenBoxes_Dropdown")
Section_Extra_OpenBoxes:Toggle({ 
	Name = "Auto-Open",
	Default = false,
	Callback = function()
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
	end,
}, "Settings_CheckUpdate_Toggle")
Section_Settings_Misc:Toggle({
	Name = "Streamer Mode",
	Default = false,
	Callback = function()
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
Section_Settings_Discord:Slider({
	Name = "Webhook Timer",
	Default = 60,
	Minimum = 60,
	Maximum = 3600,
	DisplayMethod = "Value",
	Callback = function()
	end,
}, "Settings_WebhookTimer_Slider")
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
