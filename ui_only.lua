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

--- FUNCTIONS ---
local function saveConfig()
    if MacLib.Options["Save_AutoSave_Toggle"].State then
	    MacLib:SaveConfig("bitsv3rm")
    end
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

            saveConfig()
		end
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
                return
            end
            
            if MacLib.Options["AutoFarm_Toggle"].State then
                MacLib.Options["AutoFarm_Toggle"]:UpdateState(false)
            end
            
            if MacLib.Options["AutoColosseum_Toggle"].State then
                MacLib.Options["AutoColosseum_Toggle"]:UpdateState(false)
            end

			saveConfig()
		end
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

			saveConfig()
		end
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
        task.wait(1)
        MacLib:LoadConfig("bitsv3rm")
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
