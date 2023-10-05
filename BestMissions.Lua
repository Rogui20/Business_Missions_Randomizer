util.require_natives(1676318796)

VehsList = {}
local VehTable = util.get_vehicles()
for index, vehs in pairs(VehTable) do
    if vehs.name ~= nil then
        if not util.is_this_model_a_trailer(vehs.name) then
            VehsList[#VehsList + 1] = vehs.name
        end
    end
end

require "bestmissions.ped_list"
require "bestmissions.mission_numbers"
require "bestmissions.mission_locals"

--Made for version 1.67

Wait = util.yield
joaat = util.joaat
Print = util.toast

local SupplyVehsList = {
    "scramjet",
    "toreador",
    "vigilante",
    "oppressor"
}

local WeapsList = {}
local WeapsT = util.get_weapons()
for index, weaps in pairs(WeapsT) do
    if weaps.hash ~= nil then
        WeapsList[#WeapsList + 1] = weaps.hash
    end
end

local AiHateRel = "rgFM_AiHate"
local AiLikeRel = "rgFM_AiLike"
local AiLikeHateAiHateRel = "rgFM_AiLike_HateAiHate"
local AiHateAiHateRel = "rgFM_HateAiHate"
local AiHateEveryone = "rgFM_HateEveryOne"

local MissionEnhancerMenu = menu.list(menu.my_root(), "Mission Enhancer", {}, "Randomize and enhance tools.")

local ImproveMissions = false
menu.toggle(MissionEnhancerMenu, "Enhance Missions", {}, "Let it fun.", function(Toggle)
	ImproveMissions = Toggle
	if ImproveMissions then
		while ImproveMissions do
            ScriptHandler(GunrunningT)
            ScriptHandler(ContrabandSellT)
            ScriptHandler(ContrabandBuyT)
            ScriptHandler(CayoPericoHeistT)
            ScriptHandler(CasinoHeistT)
            ScriptHandler(BikerResupplyT)
            ScriptHandler(BikerSellT)
            ScriptHandler(BusinessBattlesT)
            ScriptHandler(BusinessBattles2T)
            ScriptHandler(ContrabandBuy2T)
            ScriptHandler(HeadhunterT)
            ScriptHandler(BikerRescueContactT)
            Wait()
        end
	end
end, ImproveMissions)

local MaxCreateAttemps = 3
local OnlyTrackEnts = false
menu.toggle(MissionEnhancerMenu, "Only Track Entities", {}, "", function(Toggle)
	OnlyTrackEnts = Toggle
    if not OnlyTrackEnts then
        MaxCreateAttemps = 3
    end
    if OnlyTrackEnts then
        MaxCreateAttemps = 0
    end
end)
local AlwaysBestSellMission = false
menu.toggle(MissionEnhancerMenu, "Always Get Best Sell Mission", {}, "", function(Toggle)
	AlwaysBestSellMission = Toggle
end)
local CreateSupplies = false
menu.toggle(MissionEnhancerMenu, "Auto Create Supplies", {}, "", function(Toggle)
	CreateSupplies = Toggle
end)
local MoreSupplyVehHealth = false
menu.toggle(MissionEnhancerMenu, "More Supply Vehicle Health", {}, "Challenging.", function(Toggle)
	MoreSupplyVehHealth = Toggle
end)

local InvincibleSupply = false
menu.toggle(MissionEnhancerMenu, "Invincible Supply Entities", {}, "", function(Toggle)
	InvincibleSupply = Toggle
end)

local BringTargetsCloser = false
menu.toggle(MissionEnhancerMenu, "Bring Far Targets Closer", {}, "To make it less boring.", function(Toggle)
	BringTargetsCloser = Toggle
end)

local BringMissionCloser = false
menu.toggle(MissionEnhancerMenu, "TP All Far Away Entities Closer", {"bringallfarents"}, "Fun!!!", function(Toggle)
	BringMissionCloser = Toggle
end, BringMissionCloser)

local BringPropsCloser = false
menu.toggle(MissionEnhancerMenu, "TP All Far Props Closer", {"bringallfarprops"}, "", function(Toggle)
	BringPropsCloser = Toggle
end, BringPropsCloser)

local BringEntsLOSBased = false
menu.toggle(MissionEnhancerMenu, "TP All If Not LOS", {"bringifnotlos"}, "", function(Toggle)
	BringEntsLOSBased = Toggle
end, BringEntsLOSBased)

local AddBlipForBringedEntity = false
menu.toggle(MissionEnhancerMenu, "Add Blip To Teleported Entities", {}, "To locate.", function(Toggle)
	AddBlipForBringedEntity = Toggle
end, AddBlipForBringedEntity)

local MaxDistToBring = 20.0
menu.slider_float(MissionEnhancerMenu, "Closest Distance To Bring", {"closestbring"}, "Distance between the player and entity to teleport.", 1000, 50000, 2000, 1000, function(OnChange)
    MaxDistToBring = OnChange / 100
end)
local DistToCheck = 100.0
menu.slider_float(MissionEnhancerMenu, "Max Distance", {"maxdistancetobring"}, "How far it needs to be teleported.", 5000, 50000, 10000, 10000, function(OnChange)
    DistToCheck = OnChange / 100
end)

local AllowedMissionsMenu = menu.list(MissionEnhancerMenu, "Allowed Missions To Edit", {}, "To avoid bothering other players.")

menu.toggle(AllowedMissionsMenu, "Biker Resupply", {}, "", function(Toggle)
	BikerResupplyT.AllowedToEdit = Toggle
end, BikerResupplyT.AllowedToEdit)
menu.toggle(AllowedMissionsMenu, "Biker Sell", {}, "", function(Toggle)
	BikerSellT.AllowedToEdit = Toggle
end, BikerSellT.AllowedToEdit)
menu.toggle(AllowedMissionsMenu, "Casino Heist Preps", {}, "", function(Toggle)
	CasinoHeistT.AllowedToEdit = Toggle
end, CasinoHeistT.AllowedToEdit)
menu.toggle(AllowedMissionsMenu, "Cayo Perico Heist Preps", {}, "", function(Toggle)
	CayoPericoHeistT.AllowedToEdit = Toggle
end, CayoPericoHeistT.AllowedToEdit)
menu.toggle(AllowedMissionsMenu, "CEO Contraband Buy", {}, "", function(Toggle)
	ContrabandBuyT.AllowedToEdit = Toggle
end, ContrabandBuyT.AllowedToEdit)
menu.toggle(AllowedMissionsMenu, "CEO Contraband Buy 2", {}, "", function(Toggle)
	ContrabandBuy2T.AllowedToEdit = Toggle
end, ContrabandBuy2T.AllowedToEdit)
menu.toggle(AllowedMissionsMenu, "CEO Contraband Sell", {}, "", function(Toggle)
	ContrabandSellT.AllowedToEdit = Toggle
end, ContrabandSellT.AllowedToEdit)
menu.toggle(AllowedMissionsMenu, "Gunrunning", {}, "", function(Toggle)
	GunrunningT.AllowedToEdit = Toggle
end, GunrunningT.AllowedToEdit)
menu.toggle(AllowedMissionsMenu, "Business Battles", {}, "", function(Toggle)
	BusinessBattlesT.AllowedToEdit = Toggle
end, BusinessBattlesT.AllowedToEdit)
menu.toggle(AllowedMissionsMenu, "Business Battles 2", {}, "", function(Toggle)
	BusinessBattles2T.AllowedToEdit = Toggle
end, BusinessBattles2T.AllowedToEdit)
menu.toggle(AllowedMissionsMenu, "Head Hunter", {}, "", function(Toggle)
	HeadhunterT.AllowedToEdit = Toggle
end, HeadhunterT.AllowedToEdit)
menu.toggle(AllowedMissionsMenu, "Biker Rescue Contact", {}, "", function(Toggle)
	BikerRescueContactT.AllowedToEdit = Toggle
end, BikerRescueContactT.AllowedToEdit)

local MissionStarterMenu = menu.list(menu.my_root(), "Mission Starter (Experimental)", {}, "Make other players play fun missions.")

local SelectedMissionIndex = 1
local SelectedMission = 166
menu.list_select(MissionStarterMenu, "Which Mission Start", {"whichmission"}, "", MissionNames, SelectedMissionIndex, function(OnChange)
    SelectedMission = MissionNumbers[OnChange]
    SelectedMissionIndex = OnChange
end)

local SpecificMissionPlayers = true
menu.toggle(MissionStarterMenu, "Mission For All Players", {}, "", function(Toggle)
	SpecificMissionPlayers = Toggle
end, SpecificMissionPlayers)

local SendHost = true
menu.toggle(MissionStarterMenu, "Send Host After Start", {}, "", function(Toggle)
	SendHost = Toggle
end, SendHost)

local DuplicateScript = false
menu.toggle(MissionStarterMenu, "Duplicate Mission", {}, "", function(Toggle)
	DuplicateScript = Toggle
end, DuplicateScript)


local WhichHostMenuPTR = nil
local PlayerNames = {}
local PlayersToJoin = {}
local MissionStarter_PlayersToJoin = menu.list(MissionStarterMenu, "Which Players Send Mission", {}, "Select players to join the mission.", function()UpdatePlayersList()end, function()UpdatePlayersList()end)

for i = 1, 30 do
    if PlayersToJoin[i] == nil then
        local PlayerName = "---"
        if NETWORK.NETWORK_IS_PLAYER_ACTIVE(i-1) then
            PlayerName = PLAYER.GET_PLAYER_NAME(i-1)
        end
        PlayersToJoin[i] = {}
        PlayersToJoin[i].Include = false
        PlayersToJoin[i].MenuPTR = menu.toggle(MissionStarter_PlayersToJoin, PlayerName, {}, "", function(OnChange) PlayersToJoin[i].Include = OnChange end, PlayersToJoin[i].Include)
    end
end

function UpdatePlayersList()
    for i = 1, 30 do
        if PlayersToJoin[i] ~= nil then
            local PlayerName = "---"
            if NETWORK.NETWORK_IS_PLAYER_ACTIVE(i-1) then
                PlayerName = PLAYER.GET_PLAYER_NAME(i-1)
            end
            menu.set_menu_name(PlayersToJoin[i].MenuPTR, PlayerName)
        end
        if PlayerNames[i] ~= nil then
            local PlayerName = "---"
            if NETWORK.NETWORK_IS_PLAYER_ACTIVE(i-1) then
                PlayerName = PLAYER.GET_PLAYER_NAME(i-1)
            end
            PlayerNames[i] = PlayerName
            menu.set_list_action_options(WhichHostMenuPTR, PlayerNames)
        end
    end
end
for i = 1, 30 do
    if PlayerNames[i] == nil then
        local PlayerName = "---"
        if NETWORK.NETWORK_IS_PLAYER_ACTIVE(i-1) then
            PlayerName = PLAYER.GET_PLAYER_NAME(i-1)
        end
        PlayerNames[i] = PlayerName
    end
end

WhichHostMenuPTR = menu.list_action(MissionStarterMenu, "Start Mission To Player", {"missiontoplayer"}, "Send mission.", PlayerNames, function(OnClick)
    local Attempts = 0
    while Attempts < 100 do
        util.spoof_script("freemode", function()
            if not NETWORK.NETWORK_IS_HOST_OF_THIS_SCRIPT() then
                NETWORK.NETWORK_REQUEST_TO_BE_HOST_OF_THIS_SCRIPT()
            else
                Attempts = 100
            end
            Attempts = Attempts + 1
        end)
        Wait()
    end
    memory.write_int(memory.script_global(MissionGlobals.WhichMissionIn + MissionGlobals.NextPlayer * (OnClick - 1)), SelectedMission)
    memory.write_int(memory.script_global(MissionGlobals.InWhichPlayerIndex + MissionGlobals.NextPlayer * (OnClick - 1)), OnClick-1)
    for i = 1, 30 do
        if PlayersToJoin[i].Include or SpecificMissionPlayers then
            memory.write_int(memory.script_global(MissionGlobals.WhichMissionIn + MissionGlobals.NextPlayer * (i - 1)), SelectedMission)
            memory.write_int(memory.script_global(MissionGlobals.InWhichPlayerIndex + MissionGlobals.NextPlayer * (i - 1)), OnClick-1)
        end
    end
    for i = 1, 30 do
        if PlayerNames[i] ~= nil then
            local PlayerName = "---"
            if NETWORK.NETWORK_IS_PLAYER_ACTIVE(i-1) then
                PlayerName = PLAYER.GET_PLAYER_NAME(i-1)
            end
            PlayerNames[i] = PlayerName
            menu.set_list_action_options(WhichHostMenuPTR, PlayerNames)
        end
    end
    if DuplicateScript then
        StartMissionScript(OnClick - 1)
    end
end)

menu.action(MissionStarterMenu, "Start Mission And Players Join", {}, "", function(Toggle)
    local Attempts = 0
    while Attempts < 100 do
        util.spoof_script("freemode", function()
            if not NETWORK.NETWORK_IS_HOST_OF_THIS_SCRIPT() then
                NETWORK.NETWORK_REQUEST_TO_BE_HOST_OF_THIS_SCRIPT()
            else
                Attempts = 100
            end
            Attempts = Attempts + 1
        end)
        Wait()
    end
    local PlayerID = PLAYER.PLAYER_ID()
    for i = 1, 30 do
        if PlayersToJoin[i].Include or SpecificMissionPlayers then
            memory.write_int(memory.script_global(MissionGlobals.WhichMissionIn + MissionGlobals.NextPlayer * (i - 1)), SelectedMission)
            memory.write_int(memory.script_global(MissionGlobals.InWhichPlayerIndex + MissionGlobals.NextPlayer * (i - 1)), PlayerID)
            --memory.write_int(memory.script_global(MissionGlobals.WhichMissionIn + MissionGlobals.NextPlayer * PlayerID), SelectedMission)
            --memory.write_int(memory.script_global(MissionGlobals.InWhichPlayerIndex + MissionGlobals.NextPlayer * PlayerID), PlayerID)
        end
    end
    if DuplicateScript then
        StartMissionScript(PlayerID)
    end
end)

menu.action(MissionStarterMenu, "Start Mission For Players", {}, "Every player will start every instance of the same mission.", function(Toggle)
    local Attempts = 0
    while Attempts < 100 do
        util.spoof_script("freemode", function()
            if not NETWORK.NETWORK_IS_HOST_OF_THIS_SCRIPT() then
                NETWORK.NETWORK_REQUEST_TO_BE_HOST_OF_THIS_SCRIPT()
            else
                Attempts = 100
            end
            Attempts = Attempts + 1
        end)
        Wait()
    end
    local PlayerID = PLAYER.PLAYER_ID()
    for i = 1, 30 do
        if PlayersToJoin[i].Include or SpecificMissionPlayers then
            memory.write_int(memory.script_global(MissionGlobals.WhichMissionIn + MissionGlobals.NextPlayer * (i - 1)), SelectedMission)
            memory.write_int(memory.script_global(MissionGlobals.InWhichPlayerIndex + MissionGlobals.NextPlayer * (i - 1)), i - 1)
            --memory.write_int(memory.script_global(MissionGlobals.WhichMissionIn + MissionGlobals.NextPlayer * PlayerID), SelectedMission)
            --memory.write_int(memory.script_global(MissionGlobals.InWhichPlayerIndex + MissionGlobals.NextPlayer * PlayerID), PlayerID)
        end
    end
    if DuplicateScript then
        StartMissionScript()
    end
end)

menu.action(MissionStarterMenu, "Start Mission For Self Only", {}, "", function(Toggle)
    local Attempts = 0
    while Attempts < 100 do
        util.spoof_script("freemode", function()
            if not NETWORK.NETWORK_IS_HOST_OF_THIS_SCRIPT() then
                NETWORK.NETWORK_REQUEST_TO_BE_HOST_OF_THIS_SCRIPT()
            else
                Attempts = 100
            end
            Attempts = Attempts + 1
        end)
        Wait()
    end
    local PlayerID = PLAYER.PLAYER_ID()
    memory.write_int(memory.script_global(MissionGlobals.InWhichPlayerIndex + MissionGlobals.NextPlayer * PlayerID), PlayerID)
    if DuplicateScript then
        StartMissionScript()
    else
        memory.write_int(memory.script_global(MissionGlobals.WhichMissionStart + MissionGlobals.NextPlayer * PlayerID), SelectedMission)
    end
end)

menu.action(MissionStarterMenu, "Stop Mission", {}, "", function(Toggle)
    local PlayerID = PLAYER.PLAYER_ID()
    memory.write_int(memory.script_global(MissionGlobals.WhichMissionIn + MissionGlobals.NextPlayer * PlayerID), -1)
    memory.write_int(memory.script_global(MissionGlobals.InWhichPlayerIndex + MissionGlobals.NextPlayer * PlayerID), -1)
end)

menu.action(MissionStarterMenu, "Stop All Missions", {}, "", function(Toggle)
    for i = 1, 30 do
        memory.write_int(memory.script_global(MissionGlobals.WhichMissionIn + MissionGlobals.NextPlayer * (i - 1)), -1)
        memory.write_int(memory.script_global(MissionGlobals.InWhichPlayerIndex + MissionGlobals.NextPlayer * (i - 1)), -1)
    end
end)

local SelectedScriptIndex = 1
menu.list_action(MissionStarterMenu, "Start Script", {"whichscriptstart"}, "", ScriptNames, function(OnChange)
    SelectedScriptIndex = OnChange
    local Attempts = 0
    while Attempts < 100 do
        util.spoof_script("freemode", function()
            if not NETWORK.NETWORK_IS_HOST_OF_THIS_SCRIPT() then
                NETWORK.NETWORK_REQUEST_TO_BE_HOST_OF_THIS_SCRIPT()
            else
                Attempts = 100
            end
            Attempts = Attempts + 1
        end)
        Wait()
    end
    local PlayerID = PLAYER.PLAYER_ID()
    memory.write_int(memory.script_global(MissionGlobals.InWhichPlayerIndex + MissionGlobals.NextPlayer * PlayerID), PlayerID)
    StartScriptOnly()
end)

menu.list_action(MissionStarterMenu, "Terminate Script", {"whichscriptstartterminate"}, "", ScriptNames, function(OnChange)
    MISC.TERMINATE_ALL_SCRIPTS_WITH_THIS_NAME(ScriptArgs[OnChange].ScriptName)
end)

menu.action(MissionStarterMenu, "Stop All Scripts", {}, "", function(Toggle)
    for i = 1, #ScriptArgs do
        MISC.TERMINATE_ALL_SCRIPTS_WITH_THIS_NAME(ScriptArgs[i].ScriptName)
    end
end)

function StartMissionScript(SetHostIndex)
    local StackSize = MissionArgs[SelectedMissionIndex].StackSize
    local ScriptName = MissionArgs[SelectedMissionIndex].ScriptName
    local Arg1 = MissionArgs[SelectedMissionIndex].Arg
    SCRIPT.REQUEST_SCRIPT(ScriptName)
    while not SCRIPT.HAS_SCRIPT_LOADED(ScriptName) do
        Wait()
    end
    local Args = memory.alloc(8 * 21)
    memory.write_int(Args, Arg1)
    memory.write_int(Args + 8, -1) --Default is -1
    memory.write_int(Args + 8 * 2, -1) --Default is -1
    memory.write_int(Args + 8 * 3, -1)
    memory.write_int(Args + 8 * 4, -1)
    memory.write_int(Args + 8 * 5, -1)
    memory.write_int(Args + 8 * 6, -1)
    memory.write_int(Args + 8 * 7, -1)
    memory.write_int(Args + 8 * 8, -1)
    memory.write_int(Args + 8 * 9, -1) --Default is -1
    memory.write_int(Args + 8 * 10, -1)
    memory.write_int(Args + 8 * 11, -1)
    memory.write_int(Args + 8 * 12, -1)
    memory.write_int(Args + 8 * 13, -1)
    memory.write_int(Args + 8 * 14, -1)
    memory.write_int(Args + 8 * 15, -1)
    memory.write_int(Args + 8 * 16, -1) --Default is -1
    memory.write_int(Args + 8 * 17, -1)
    memory.write_int(Args + 8 * 18, -1)
    memory.write_int(Args + 8 * 19, -1) --Default is -1
    memory.write_int(Args + 8 * 20, -1) --Default is -1
    SYSTEM.START_NEW_SCRIPT_WITH_ARGS(ScriptName, Args, 21, StackSize)
    SCRIPT.SET_SCRIPT_AS_NO_LONGER_NEEDED(ScriptName)
    if SendHost then
        if SetHostIndex ~= nil then
            local HasGetScriptHost = false
            local HasGaveScriptHost = false
            for i = 1, 300 do
                if not HasGaveScriptHost then
                    util.spoof_script(ScriptName, function()
                        HasGetScriptHost = NETWORK.NETWORK_IS_HOST_OF_THIS_SCRIPT()
                        if not HasGetScriptHost then
                            NETWORK.NETWORK_REQUEST_TO_BE_HOST_OF_THIS_SCRIPT()
                        end
                        HasGetScriptHost = NETWORK.NETWORK_IS_HOST_OF_THIS_SCRIPT()
                    end)
                end
                if HasGetScriptHost then
                    if not HasGaveScriptHost then
                        HasGaveScriptHost = util.give_script_host(ScriptName, SetHostIndex)
                    end
                end
                Wait()
            end
        end
    end
end

function StartScriptOnly(SetHostIndex)
    local StackSize = ScriptArgs[SelectedScriptIndex].StackSize
    local ScriptName = ScriptArgs[SelectedScriptIndex].ScriptName
    local Arg1 = ScriptArgs[SelectedScriptIndex].Arg
    SCRIPT.REQUEST_SCRIPT(ScriptName)
    while not SCRIPT.HAS_SCRIPT_LOADED(ScriptName) do
        Wait()
    end
    local Args = memory.alloc(8 * 21)
    memory.write_int(Args, Arg1)
    memory.write_int(Args + 8, -1) --Default is -1
    memory.write_int(Args + 8 * 2, -1) --Default is -1
    memory.write_int(Args + 8 * 3, 0)
    memory.write_int(Args + 8 * 4, 0)
    memory.write_int(Args + 8 * 5, 0)
    memory.write_int(Args + 8 * 6, 0)
    memory.write_int(Args + 8 * 7, 0)
    memory.write_int(Args + 8 * 8, 0)
    memory.write_int(Args + 8 * 9, -1) --Default is -1
    memory.write_int(Args + 8 * 10, 0)
    memory.write_int(Args + 8 * 11, 0)
    memory.write_int(Args + 8 * 12, 0)
    memory.write_int(Args + 8 * 13, 0)
    memory.write_int(Args + 8 * 14, 0)
    memory.write_int(Args + 8 * 15, 0)
    memory.write_int(Args + 8 * 16, -1) --Default is -1
    memory.write_int(Args + 8 * 17, 0)
    memory.write_int(Args + 8 * 18, 0)
    memory.write_int(Args + 8 * 19, -1) --Default is -1
    memory.write_int(Args + 8 * 20, -1) --Default is -1
    SYSTEM.START_NEW_SCRIPT_WITH_ARGS(ScriptName, Args, 21, StackSize)
    SCRIPT.SET_SCRIPT_AS_NO_LONGER_NEEDED(ScriptName)
    if SendHost then
        if SetHostIndex ~= nil then
            local HasGetScriptHost = false
            local HasGaveScriptHost = false
            for i = 1, 300 do
                if not HasGaveScriptHost then
                    util.spoof_script(ScriptName, function()
                        HasGetScriptHost = NETWORK.NETWORK_IS_HOST_OF_THIS_SCRIPT()
                        if not HasGetScriptHost then
                            NETWORK.NETWORK_REQUEST_TO_BE_HOST_OF_THIS_SCRIPT()
                        end
                        HasGetScriptHost = NETWORK.NETWORK_IS_HOST_OF_THIS_SCRIPT()
                    end)
                end
                if HasGetScriptHost then
                    if not HasGaveScriptHost then
                        HasGaveScriptHost = util.give_script_host(ScriptName, SetHostIndex)
                    end
                end
                Wait()
            end
        end
    end
end

local MissionSettingsMenu = menu.list(menu.my_root(), "Mission Settings", {}, "Disable some missions (Self only).")

menu.toggle_loop(MissionSettingsMenu, "Avoid Lupe Missions", {}, "", function(Toggle)
    local PlayerID = PLAYER.PLAYER_ID()
    if memory.read_int(memory.script_global(MissionGlobals.WhichMissionStart + MissionGlobals.NextPlayer * PlayerID)) == 294 then
        memory.write_int(memory.script_global(MissionGlobals.WhichMissionStart + MissionGlobals.NextPlayer * PlayerID), 167)
    end
end)

local AppsMenu = menu.list(menu.my_root(), "Business Apps", {}, "Manage businesses anywhere!")
local BikerAppsMenu = menu.list(AppsMenu, "Biker Apps", {}, "")

menu.action(BikerAppsMenu, "Open Road App", {}, "", function(Toggle)
    StartAppScript("appBikerBusiness", 4592, -1)
end)
menu.action(BikerAppsMenu, "Document Forgery App", {}, "", function(Toggle)
    StartAppScript("appBikerBusiness", 4592, 31)
end)
menu.action(BikerAppsMenu, "Weed Factory App", {}, "", function(Toggle)
    StartAppScript("appBikerBusiness", 4592, 28)
end)
menu.action(BikerAppsMenu, "Counterfeit Cash Factory App", {}, "", function(Toggle)
    StartAppScript("appBikerBusiness", 4592, 30)
end)
menu.action(BikerAppsMenu, "Close Biker App", {}, "Can fix your game sometimes.", function(Toggle)
    if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("appbikerbusiness")) > 0 then
        MISC.TERMINATE_ALL_SCRIPTS_WITH_THIS_NAME("appbikerbusiness")
        Print("Terminated")
    end
end)

local SecuroServAppsMenu = menu.list(AppsMenu, "SecuroServ Apps", {}, "")
menu.action(SecuroServAppsMenu, "Office App", {}, "", function(Toggle)
    StartAppScript("appSecuroServ", 4592, -1, 88)
end)

local UtilsMenu = menu.list(menu.my_root(), "Utils", {}, "")
menu.action(UtilsMenu, "Clear Blips", {}, "", function(Toggle)
    for i = 1, HUD.GET_NUMBER_OF_ACTIVE_BLIPS() do
        local Blip = HUD.GET_NEXT_BLIP_INFO_ID(1)
        if Blip ~= 0 then
            local Colour = HUD.GET_BLIP_COLOUR(Blip)
            if Colour == 1 or Colour == 3 then
                util.remove_blip(Blip)
            end
        end
        local Blip2 = HUD.GET_NEXT_BLIP_INFO_ID(586)
        if Blip2 ~= 0 then
            local Colour = HUD.GET_BLIP_COLOUR(Blip2)
            if Colour == 2 then
                util.remove_blip(Blip2)
            end
        end
    end
end)
local MiscMenu = menu.list(menu.my_root(), "Misc", {}, "")
--[[
menu.toggle_loop(MiscMenu, "B Battle Collect All 8 Crates", {""}, "", function(toggle)
	local Pickups = entities.get_all_pickups_as_handles()
	for index, crates in ipairs(Pickups) do
		if ENTITY.GET_ENTITY_SCRIPT(crates, 0) == "fm_content_business_battles"
		and not ENTITY.IS_ENTITY_ATTACHED_TO_ANY_PED(crates) then
            if NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(crates) then
                ENTITY.ATTACH_ENTITY_TO_ENTITY(crates, PLAYER.PLAYER_PED_ID(), 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
                --OBJECT.ATTACH_PORTABLE_PICKUP_TO_PED(crates, PLAYER.PLAYER_PED_ID())
            end
		end
	end
end)

menu.action(MiscMenu, "B Battle2 Args", {}, "", function(Toggle)
    memory.write_int(memory.script_global(SplitGlobals("Global_2756336.f_183")), 1)
    memory.write_int(memory.script_global(SplitGlobals("Global_2756336.f_184")), 2)
end)
]]
local PartyNightLights = false
menu.toggle(MiscMenu, "Party Night Lights", {""}, "", function(Toggle)
    PartyNightLights = Toggle
    if PartyNightLights then
        local VehiclesT = {}
        local PedsT = {}
        local LinesT = {}
        while PartyNightLights do
            local Hours = CLOCK.GET_CLOCK_HOURS()
            if Hours > 17 or Hours < 6 then
                for index, vehicles in pairs(entities.get_all_vehicles_as_handles()) do
                    if not ENTITY.IS_ENTITY_DEAD(vehicles) then
                        if VehiclesT[vehicles] == nil then
                            VehiclesT[vehicles] = {R = math.random(0, 255), G = math.random(0, 255), B = math.random(0, 255), Force = 20.0}
                        end
                    end
                end
                for index, values in pairs(VehiclesT) do
                    if VehiclesT[index] ~= nil then
                        if ENTITY.DOES_ENTITY_EXIST(index) then
                            local LightL = ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(index, "headlight_l")
                            local LightR = ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(index, "headlight_r")
                            local FVect = ENTITY.GET_ENTITY_FORWARD_VECTOR(index)
                            if LightL ~= 0 then
                                local Pos = ENTITY.GET_WORLD_POSITION_OF_ENTITY_BONE(index, LightL)
                                Pos.x = Pos.x - FVect.x
                                Pos.y = Pos.y - FVect.y
                                Pos.z = Pos.z - FVect.z
                                GRAPHICS.DRAW_SPOT_LIGHT(Pos.x, Pos.y, Pos.z, FVect.x, FVect.y, FVect.z, values.R, values.G, values.B, 100.0, values.Force, 1.0, 20.0, 1.0)
                            end
                            if LightR ~= 0 then
                                local Pos = ENTITY.GET_WORLD_POSITION_OF_ENTITY_BONE(index, LightR)
                                Pos.x = Pos.x - FVect.x
                                Pos.y = Pos.y - FVect.y
                                Pos.z = Pos.z - FVect.z
                                GRAPHICS.DRAW_SPOT_LIGHT(Pos.x, Pos.y, Pos.z, FVect.x, FVect.y, FVect.z, values.R, values.G, values.B, 100.0, values.Force, 1.0, 20.0, 1.0)
                            end
                            if LightL == 0 and LightR == 0 then
                                local Pos = ENTITY.GET_ENTITY_COORDS(index)
                                Pos.x = Pos.x + FVect.x
                                Pos.y = Pos.y + FVect.y
                                Pos.z = Pos.z + FVect.z
                                GRAPHICS.DRAW_SPOT_LIGHT(Pos.x, Pos.y, Pos.z, FVect.x, FVect.y, FVect.z, values.R, values.G, values.B, 100.0, values.Force, 1.0, 20.0, 1.0)
                            end
                            if ENTITY.IS_ENTITY_DEAD(index) then
                                values.Force = values.Force - 0.1
                                if values.Force <= 0.0 then
                                    PedsT[index] = nil
                                end
                            end
                        else
                            VehiclesT[index] = nil
                        end
                    end
                end
                for index, peds in pairs(entities.get_all_peds_as_handles()) do
                    if not ENTITY.IS_ENTITY_DEAD(peds) then
                        if PedsT[peds] == nil then
                            PedsT[peds] = {R = math.random(0, 255), G = math.random(0, 255), B = math.random(0, 255), Force = 10.0}
                        end
                    end
                end
                for index, values in pairs(PedsT) do
                    if PedsT[index] ~= nil then
                        if ENTITY.DOES_ENTITY_EXIST(index) then
                            local Pos = ENTITY.GET_ENTITY_COORDS(index)
                            local FVect = ENTITY.GET_ENTITY_FORWARD_VECTOR(index)
                            GRAPHICS.DRAW_LIGHT_WITH_RANGE(Pos.x, Pos.y, Pos.z, values.R, values.G, values.B, 20.0, values.Force)
                            local ToPos = {}
                            ToPos.x = Pos.x - FVect.x
                            ToPos.y = Pos.y - FVect.y
                            ToPos.z = Pos.z - FVect.z
                            --GRAPHICS.DRAW_SPOT_LIGHT(ToPos.x, ToPos.y, ToPos.z, FVect.x, FVect.y, FVect.z, values.R, values.G, values.B, 100.0, values.Force, 1.0, 20.0, 1.0)
                            local GunEntityBullet = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(index, false)
                            if GunEntityBullet ~= 0 then
                                local WP_FVect, WP_RVect, WP_UpVect, WP_Vect = v3.new(), v3.new(), v3.new(), v3.new()
                                ENTITY.GET_ENTITY_MATRIX(GunEntityBullet, WP_FVect, WP_RVect, WP_UpVect, WP_Vect)
                                GRAPHICS.DRAW_SPOT_LIGHT(WP_Vect.x, WP_Vect.y, WP_Vect.z, WP_RVect.x, WP_RVect.y, WP_RVect.z, values.R, values.G, values.B, 100.0, values.Force, 1.0, 10.0, 1.0)
                                if PED.IS_PED_SHOOTING(index) then
                                    local GunMuzzleBoneID = ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(GunEntityBullet, "gun_muzzle")
                                    if GunMuzzleBoneID ~= 0 then
                                        local GunBoneCoords = ENTITY.GET_WORLD_POSITION_OF_ENTITY_BONE(GunEntityBullet, GunMuzzleBoneID)
                                        local HitCoords = v3.new()
                                        local HasHit = WEAPON.GET_PED_LAST_WEAPON_IMPACT_COORD(index, HitCoords)
                                        if HasHit then
                                            local IEdit = #LinesT + 1
                                            LinesT[IEdit] = {}
                                            LinesT[IEdit].StartX = GunBoneCoords.x
                                            LinesT[IEdit].StartY = GunBoneCoords.y
                                            LinesT[IEdit].StartZ = GunBoneCoords.z
                                            LinesT[IEdit].EndX = HitCoords.x
                                            LinesT[IEdit].EndY = HitCoords.y
                                            LinesT[IEdit].EndZ = HitCoords.z
                                            LinesT[IEdit].R = math.random(0, 255)
                                            LinesT[IEdit].G = math.random(0, 255)
                                            LinesT[IEdit].B = math.random(0, 255)
                                            LinesT[IEdit].Alpha = 255
                                            
                                        end
                                    end
                                end
                            end
                            if ENTITY.IS_ENTITY_DEAD(index) then
                                values.Force = values.Force - 0.1
                                if values.Force <= 0.0 then
                                    PedsT[index] = nil
                                end
                            end
                        else
                            PedsT[index] = nil
                        end
                    end
                end
                for i = 1, #LinesT do
                    if LinesT[i] ~= nil then
                        GRAPHICS.DRAW_LINE(LinesT[i].StartX, LinesT[i].StartY, LinesT[i].StartZ, LinesT[i].EndX, LinesT[i].EndY, LinesT[i].EndZ, LinesT[i].R, LinesT[i].G, LinesT[i].B, LinesT[i].Alpha)
                        GRAPHICS.DRAW_LIGHT_WITH_RANGE(LinesT[i].EndX, LinesT[i].EndY, LinesT[i].EndZ, LinesT[i].R, LinesT[i].G, LinesT[i].B, 0.50, 155.0)
                        LinesT[i].Alpha = LinesT[i].Alpha - 3
                        if LinesT[i].Alpha <= 0 then
                            --LinesT[i] = nil
                            table.remove(LinesT, i)
                        end
                    end
                end
            else
                Wait(1000)
            end
            Wait()
        end
    end
end)

local MaintainStealth = false
menu.toggle(MiscMenu, "Maintain Stealth", {""}, "", function(Toggle)
    MaintainStealth = Toggle
    if MaintainStealth then
        while MaintainStealth do
            for index, peds in pairs(entities.get_all_peds_as_handles()) do
                if not ENTITY.IS_ENTITY_DEAD(peds) then
                    if not PED.IS_PED_A_PLAYER(peds) then
                        if ENTITY.IS_ENTITY_A_MISSION_ENTITY(peds) then
                            if NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(peds) then
                                PED.SET_PED_HEARING_RANGE(peds, 0.0)
                                PED.SET_PED_SEEING_RANGE(peds, 0.0)
                                ENTITY.SET_ENTITY_HEALTH(peds, 101)
                            end
                        end
                    end
                end
            end
            Wait()
        end
    end
end)

menu.toggle_loop(MiscMenu, "B Battle Collect All 8 Crates", {""}, "", function(toggle)
	local Pickups = entities.get_all_pickups_as_handles()
	for index, crates in ipairs(Pickups) do
		if ENTITY.GET_ENTITY_SCRIPT(crates, 0) == "fm_content_business_battles"
		and not ENTITY.IS_ENTITY_ATTACHED_TO_ANY_PED(crates) then
            if NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(crates) then
                ENTITY.ATTACH_ENTITY_TO_ENTITY(crates, PLAYER.PLAYER_PED_ID(), 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
                --OBJECT.ATTACH_PORTABLE_PICKUP_TO_PED(crates, PLAYER.PLAYER_PED_ID())
            end
		end
	end
end)

local DevToolsMenu = menu.list(menu.my_root(), "DEV Tools", {}, "")
menu.action(DevToolsMenu, "Copy Coords And Heading", {}, "", function(Toggle)
    local Coords = ENTITY.GET_ENTITY_COORDS(PLAYER.PLAYER_PED_ID())
    local Heading = ENTITY.GET_ENTITY_HEADING(PLAYER.PLAYER_PED_ID())
    --util.copy_to_clipboard(Coords.x .. ", " .. Coords.y .. ", " .. Coords.z .. ", " .. Heading)
    util.copy_to_clipboard("x = " .. Coords.x .. ", y = " .. Coords.y .. ", z = " .. Coords.z .. ", heading = " .. Heading)
end)

menu.action(DevToolsMenu, "Test", {}, "", function(Toggle)
    --util.copy_to_clipboard(string.format("%X", memory.script_global(AppGlobals.PropertyNumber + AppGlobals.NextPlayer * PLAYER.PLAYER_ID())))
    --util.copy_to_clipboard(string.format("%X", memory.script_global(AppGlobals.PropertyID + AppGlobals.NextPlayerPropertyID * PLAYER.PLAYER_ID())))
    --Print(SplitGlobals("Local_94.f_2[iParam0 /*26*/].f_3[iVar1].f_2"))
    util.copy_to_clipboard(string.format("%X", memory.script_global(MissionGlobals.WhichMissionStart + MissionGlobals.NextPlayer * PLAYER.PLAYER_ID())))
end)

menu.text_input(DevToolsMenu, "Copy Local Addr", {"copylocaladdr"}, "For devs.", function(OnChange)
    local TXTToNumber = SplitGlobals(OnChange)
    if TXTToNumber ~= nil then
        util.copy_to_clipboard(string.format("%X", memory.script_local("fm_content_cargo", TXTToNumber)))
    end
end)

menu.text_input(DevToolsMenu, "Copy Global Addr", {"copyglobaladdr"}, "For devs.", function(OnChange)
    local TXTToNumber = SplitGlobals(OnChange)
    if TXTToNumber ~= nil then
        util.copy_to_clipboard(string.format("%X", memory.script_global(TXTToNumber)))
    end
end)

function StartAppScript(ScriptName, StackSize, PropertyNumber, PropertyID)
    memory.write_int(memory.script_global(AppGlobals.AppState), 0)
    if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat(string.lower(ScriptName))) == 0 then
        local PlayerID = PLAYER.PLAYER_ID()
        if PropertyNumber ~= nil then
            memory.write_int(memory.script_global(AppGlobals.PropertyNumber + AppGlobals.NextPlayer * PlayerID), PropertyNumber)
        end
        if PropertyID ~= nil then
            memory.write_int(memory.script_global(AppGlobals.PropertyID + AppGlobals.NextPlayerPropertyID * PlayerID), PropertyID)
        end
        SCRIPT.REQUEST_SCRIPT(ScriptName)
        while not SCRIPT.HAS_SCRIPT_LOADED(ScriptName) do
            Wait()
        end
        SYSTEM.START_NEW_SCRIPT(ScriptName, StackSize)
        SCRIPT.SET_SCRIPT_AS_NO_LONGER_NEEDED(ScriptName)
        if PropertyNumber ~= nil then
            while SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat(string.lower(ScriptName))) > 0 do
                Wait()
            end
            memory.write_int(memory.script_global(AppGlobals.PropertyNumber + AppGlobals.NextPlayer * PlayerID), -1)
        end
        if PropertyID ~= nil then
            while SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat(string.lower(ScriptName))) > 0 do
                Wait()
            end
            memory.write_int(memory.script_global(AppGlobals.PropertyID + AppGlobals.NextPlayerPropertyID * PlayerID), -1)
        end
        memory.write_int(memory.script_global(AppGlobals.AppState), 0)
    end
end

menu.action(DevToolsMenu, "freemode Host", {}, "", function(Toggle)
	util.spoof_script("freemode", function()
        Print(NETWORK.NETWORK_IS_HOST_OF_THIS_SCRIPT())
        --NETWORK.NETWORK_REQUEST_TO_BE_HOST_OF_THIS_SCRIPT()
        --Print(NETWORK.NETWORK_IS_HOST_OF_THIS_SCRIPT())
    end)
    util.spoof_script("am_launcher", function()
        --Print(NETWORK.NETWORK_IS_HOST_OF_THIS_SCRIPT())
        --NETWORK.NETWORK_REQUEST_TO_BE_HOST_OF_THIS_SCRIPT()
        --Print(NETWORK.NETWORK_IS_HOST_OF_THIS_SCRIPT())
    end)
end)

menu.action(DevToolsMenu, "freemode Request Host", {}, "", function(Toggle)
	util.spoof_script("freemode", function()
        NETWORK.NETWORK_REQUEST_TO_BE_HOST_OF_THIS_SCRIPT()
        Print(NETWORK.NETWORK_IS_HOST_OF_THIS_SCRIPT())
    end)
    util.spoof_script("am_launcher", function()
        NETWORK.NETWORK_REQUEST_TO_BE_HOST_OF_THIS_SCRIPT()
        Print(NETWORK.NETWORK_IS_HOST_OF_THIS_SCRIPT())
    end)
end)

menu.toggle_loop(DevToolsMenu, "Be Host of Mission Controller", {}, "", function(Toggle)
    util.spoof_script("fm_mission_controller", function()
        if not NETWORK.NETWORK_IS_HOST_OF_THIS_SCRIPT() then
            NETWORK.NETWORK_REQUEST_TO_BE_HOST_OF_THIS_SCRIPT()
        end
        if NETWORK.NETWORK_IS_HOST_OF_THIS_SCRIPT() then
            NETWORK.NETWORK_PREVENT_SCRIPT_HOST_MIGRATION()
        end
    end)
    util.spoof_script("fm_mission_controller_2020", function()
        if not NETWORK.NETWORK_IS_HOST_OF_THIS_SCRIPT() then
            NETWORK.NETWORK_REQUEST_TO_BE_HOST_OF_THIS_SCRIPT()
        end
        if NETWORK.NETWORK_IS_HOST_OF_THIS_SCRIPT() then
            NETWORK.NETWORK_PREVENT_SCRIPT_HOST_MIGRATION()
        end
    end)
end)

menu.action(DevToolsMenu, "B Battle2 Args", {}, "", function(Toggle)
    memory.write_int(memory.script_global(SplitGlobals("Global_2756336.f_183")), 1)
    memory.write_int(memory.script_global(SplitGlobals("Global_2756336.f_184")), 2)
end)

function CopyVehSettingsToAnotherVeh(CopyVehSetts, ToVeh)
	local EngineHealth = VEHICLE.GET_VEHICLE_ENGINE_HEALTH(CopyVehSetts)
	local PetrolTankHealth = VEHICLE.GET_VEHICLE_PETROL_TANK_HEALTH(CopyVehSetts)
	local BodyHealth = VEHICLE.GET_VEHICLE_BODY_HEALTH(CopyVehSetts)
	local MaxHealth = ENTITY.GET_ENTITY_MAX_HEALTH(CopyVehSetts)
	local Health = ENTITY.GET_ENTITY_HEALTH(CopyVehSetts)
    local PColor, SColor = memory.alloc_int(), memory.alloc_int()
    VEHICLE.GET_VEHICLE_COLOURS(CopyVehSetts, PColor, SColor)
    VEHICLE.SET_VEHICLE_COLOURS(ToVeh, memory.read_int(PColor), memory.read_int(SColor))
	ENTITY.SET_ENTITY_MAX_HEALTH(ToVeh, MaxHealth)
	ENTITY.SET_ENTITY_HEALTH(ToVeh, Health)
	VEHICLE.SET_VEHICLE_ENGINE_HEALTH(ToVeh, EngineHealth)
	VEHICLE.SET_PLANE_ENGINE_HEALTH(ToVeh, EngineHealth)
	VEHICLE.SET_VEHICLE_PETROL_TANK_HEALTH(ToVeh, PetrolTankHealth)
	VEHICLE.SET_VEHICLE_BODY_HEALTH(ToVeh, BodyHealth)
    --for i = 0, 49 do
    --    local VehMod = VEHICLE.GET_VEHICLE_MOD(CopyVehSetts, i)
    --    VEHICLE.SET_VEHICLE_MOD(ToVeh, i, VehMod, false)
    --end
    for k = 0, 48 do
        local NumMods = entities.get_upgrade_max_value(ToVeh, k)
        if NumMods > 0 then
            local Rand = math.random(0, NumMods)
            if Rand <= -1 then
                Rand = 0
            end
            entities.set_upgrade_value(ToVeh, k, Rand, false)
        else
            if math.random(0, 1) == 1 then
                entities.set_upgrade_value(ToVeh, k, NumMods, false)
            end
        end
    end
end

function SetSupplyVehSettings(Veh, Health)
    ENTITY.SET_ENTITY_MAX_HEALTH(Veh, Health + 50000)
	ENTITY.SET_ENTITY_HEALTH(Veh, Health + 50000)
	VEHICLE.SET_VEHICLE_ENGINE_HEALTH(Veh, 50000 + Health)
	VEHICLE.SET_PLANE_ENGINE_HEALTH(Veh, 50000 + Health)
	VEHICLE.SET_VEHICLE_PETROL_TANK_HEALTH(Veh, 50000 + Health)
	VEHICLE.SET_VEHICLE_BODY_HEALTH(Veh, 50000 + Health)
    VEHICLE.SET_VEHICLE_CAN_BE_TARGETTED(Veh, false)
    VEHICLE.SET_VEHICLE_ALLOW_HOMING_MISSLE_LOCKON(Veh, false, false)
    VEHICLE.SET_VEHICLE_TYRES_CAN_BURST(Veh, false)
    VEHICLE.SET_VEHICLE_STRONG(Veh, true)
    for k = 0, 48 do
        local NumMods = entities.get_upgrade_max_value(Veh, k)
        if NumMods > 0 then
            local Rand = math.random(0, NumMods)
            if Rand <= -1 then
                Rand = 0
            end
            entities.set_upgrade_value(Veh, k, Rand, false)
        else
            if math.random(0, 1) == 1 then
                entities.set_upgrade_value(Veh, k, NumMods, false)
            end
        end
    end
end

function NetworkEntityVehicle(Entity)
    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(Entity, false, true)
    local EntNetID = NETWORK.VEH_TO_NET(Entity)
    NETWORK.SET_NETWORK_ID_EXISTS_ON_ALL_MACHINES(EntNetID, true)
    NETWORK.SET_NETWORK_ID_ALWAYS_EXISTS_FOR_PLAYER(EntNetID, PLAYER.PLAYER_ID(), true)
    return EntNetID
end

function NetworkEntityPed(Entity)
    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(Entity, false, true)
    local EntNetID = NETWORK.PED_TO_NET(Entity)
    NETWORK.SET_NETWORK_ID_EXISTS_ON_ALL_MACHINES(EntNetID, true)
    NETWORK.SET_NETWORK_ID_ALWAYS_EXISTS_FOR_PLAYER(EntNetID, PLAYER.PLAYER_ID(), true)
    return EntNetID
end

function NetworkEntityObject(Entity)
    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(Entity, false, true)
    local EntNetID = NETWORK.OBJ_TO_NET(Entity)
    NETWORK.SET_NETWORK_ID_EXISTS_ON_ALL_MACHINES(EntNetID, true)
    NETWORK.SET_NETWORK_ID_ALWAYS_EXISTS_FOR_PLAYER(EntNetID, PLAYER.PLAYER_ID(), true)
    return EntNetID
end

function SetPedCombatAbilities(ped)
	PED.SET_PED_COMBAT_ATTRIBUTES(ped, 5, true)
	PED.SET_PED_COMBAT_ATTRIBUTES(ped, 1, true)
	PED.SET_PED_COMBAT_ATTRIBUTES(ped, 13, true)
	PED.SET_PED_COMBAT_ATTRIBUTES(ped, 21, true)
	PED.SET_PED_COMBAT_ATTRIBUTES(ped, 38, true)
	PED.SET_PED_COMBAT_ATTRIBUTES(ped, 46, true)
	PED.SET_PED_COMBAT_MOVEMENT(ped, 2)
	PED.SET_PED_COMBAT_ABILITY(ped, 2)
	PED.SET_PED_COMBAT_RANGE(ped, 2)
	PED.SET_PED_SEEING_RANGE(ped, 100.0)
	PED.SET_PED_TARGET_LOSS_RESPONSE(ped, 1)
	PED.SET_PED_HIGHLY_PERCEPTIVE(ped, true)
	PED.SET_PED_VISUAL_FIELD_PERIPHERAL_RANGE(ped, 400.0)
	PED.SET_COMBAT_FLOAT(ped, 10, 400.0)
end

function Request_Model(Model)
    if STREAMING.IS_MODEL_VALID(Model) then
        STREAMING.REQUEST_MODEL(Model)
        while not STREAMING.HAS_MODEL_LOADED(Model) do
			Wait()
        end
    end
end

function Request_Entity_Control(entity)
	if not NETWORK.NETWORK_IS_IN_SESSION() then
		return true
	end
	local netId = NETWORK.NETWORK_GET_NETWORK_ID_FROM_ENTITY(entity)
	NETWORK.SET_NETWORK_ID_CAN_MIGRATE(netId, true)
	return NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(entity)
end

local MaxZeroTick = 100
local MaxTickReachToWrite = 800

function ScriptHandler(ArgsTable)
    if ArgsTable.AllowedToEdit then
        local ScriptName = ArgsTable.ScriptName
        if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat(ScriptName)) > 0 and ImproveMissions then
            local IsParticipant = false
            util.spoof_script(ScriptName, function()
                IsParticipant = NETWORK.NETWORK_IS_PLAYER_A_PARTICIPANT(PLAYER.PLAYER_ID())
            end)
            if IsParticipant then
                local IsHost = false
                util.spoof_script(ScriptName, function()
                    IsHost = NETWORK.NETWORK_IS_HOST_OF_THIS_SCRIPT()
                    if not IsHost then
                        NETWORK.NETWORK_REQUEST_TO_BE_HOST_OF_THIS_SCRIPT()
                    end
                    IsHost = NETWORK.NETWORK_IS_HOST_OF_THIS_SCRIPT()
                    if IsHost then
                        NETWORK.NETWORK_PREVENT_SCRIPT_HOST_MIGRATION()
                    end
                end)
                if IsHost then
                    local PlayerPed = PLAYER.PLAYER_PED_ID()
                    local PlPos = ENTITY.GET_ENTITY_COORDS(PlayerPed)
                    if ArgsTable.LocalToEditT ~= nil then
                        if ArgsTable.LocalToEditT.Tick < ArgsTable.LocalToEditT.MaxTick then
                            ArgsTable.LocalToEditT.Tick = ArgsTable.LocalToEditT.Tick + 1
                            if ArgsTable.LocalToEditT.Tick >= ArgsTable.LocalToEditT.MaxTick then
                                if memory.read_int(memory.script_local(ScriptName, ArgsTable.LocalToEditT.LocalAddr)) == ArgsTable.LocalToEditT.Num then
                                    memory.write_int(memory.script_local(ScriptName, ArgsTable.LocalToEditT.LocalAddr), ArgsTable.LocalToEditT.ToNum)
                                end
                            end
                        end
                    end
                    if ArgsTable.LocalsToEditT ~= nil then
                        for k = 1, #ArgsTable.LocalsToEditT do
                            if ArgsTable.LocalsToEditT[k].MaxTick == nil and ArgsTable.LocalsToEditT[k].Num == nil and ArgsTable.LocalsToEditT[k].Tick then
                                memory.write_int(memory.script_local(ScriptName, ArgsTable.LocalsToEditT[k].LocalAddr), ArgsTable.LocalsToEditT[k].ToNum)
                            else
                                ArgsTable.LocalsToEditT[k].Tick = ArgsTable.LocalsToEditT[k].Tick + 1
                                if ArgsTable.LocalsToEditT[k].Tick >= ArgsTable.LocalsToEditT[k].MaxTick then
                                    if memory.read_int(memory.script_local(ScriptName, ArgsTable.LocalsToEditT[k].LocalAddr)) == ArgsTable.LocalsToEditT[k].Num then
                                        memory.write_int(memory.script_local(ScriptName, ArgsTable.LocalsToEditT[k].LocalAddr), ArgsTable.LocalsToEditT[k].ToNum)
                                    end
                                end
                            end
                        end
                    end
                    if AlwaysBestSellMission then
                        if ArgsTable.BestSellMission ~= nil then
                            memory.write_int(memory.script_local(ScriptName, ArgsTable.BestSellMission.LocalAddr), ArgsTable.BestSellMission.ToNum)
                        end
                    end
                    for k = 1, #ArgsTable.Vehicles do
                        for i = 1, ArgsTable.Vehicles[k].MaxLen do
                            if ArgsTable.Vehicles[k].VehiclesT[i] == nil then
                                local OldNetID = memory.read_int(memory.script_local(ScriptName, ArgsTable.Vehicles[k].LocalAddr + ArgsTable.Vehicles[k].NextOffset * (i - ArgsTable.Vehicles[k].DecreaseI)))
                                if OldNetID > 0 then
                                    local OldVehHandle = 0
                                    util.spoof_script(ScriptName, function()
                                        OldVehHandle = NETWORK.NET_TO_VEH(OldNetID)
                                    end)
                                    if OldVehHandle ~= 0 then
                                        if not ENTITY.IS_ENTITY_DEAD(OldVehHandle) then
                                            local EntType = ENTITY.GET_ENTITY_TYPE(OldVehHandle)
                                            if EntType == 2 then
                                                local VehModelToUse = ArgsTable.Vehicles[k].SelectedModels[math.random(#ArgsTable.Vehicles[k].SelectedModels)]
                                                local EntModel = ENTITY.GET_ENTITY_MODEL(OldVehHandle)
                                                local UpgradeType = 1
                                                local HandleToSet = 0
                                                local OldHandleToSet = OldVehHandle
                                                local NetIDToSet = 0
                                                if ArgsTable.Vehicles[k].UpgradeType ~= nil then
                                                    UpgradeType = ArgsTable.Vehicles[k].UpgradeType
                                                end
                                                if not util.is_this_model_a_trailer(EntModel) then
                                                    if ArgsTable.Vehicles[k].DisabledModels ~= nil then
                                                        for j = 1, #ArgsTable.Vehicles[k].DisabledModels do
                                                            if EntModel == joaat(ArgsTable.Vehicles[k].DisabledModels[j].Model1) then
                                                                if ArgsTable.Vehicles[k].DisabledModels[j].Model2 ~= nil then
                                                                    VehModelToUse = ArgsTable.Vehicles[k].DisabledModels[j].Model2
                                                                    if ArgsTable.Vehicles[k].DisabledModels[j].Model1 == ArgsTable.Vehicles[k].DisabledModels[j].Model2 then
                                                                        HandleToSet = OldVehHandle
                                                                        NetIDToSet = OldNetID
                                                                        OldHandleToSet = 0
                                                                    end
                                                                end
                                                                if ArgsTable.Vehicles[k].DisabledModels[j].UpgradeType ~= nil then
                                                                    UpgradeType = ArgsTable.Vehicles[k].DisabledModels[j].UpgradeType
                                                                end
                                                            end
                                                        end
                                                    end
                                                    ArgsTable.Vehicles[k].VehiclesT[i] = {Model = VehModelToUse, NetID = NetIDToSet, Handle = HandleToSet, OldHandle = OldHandleToSet, UpgradeType = UpgradeType, OldNetID = OldNetID, Attempts = 0}
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                            if ArgsTable.Vehicles[k].VehiclesT[i] ~= nil then
                                if ArgsTable.Vehicles[k].VehiclesT[i].NetID == 0 then
                                    if ArgsTable.Vehicles[k].VehiclesT[i].Attempts < MaxCreateAttemps then
                                        if not STREAMING.HAS_MODEL_LOADED(joaat(ArgsTable.Vehicles[k].VehiclesT[i].Model)) then
                                            STREAMING.REQUEST_MODEL(joaat(ArgsTable.Vehicles[k].VehiclesT[i].Model))
                                        end
                                        if STREAMING.HAS_MODEL_LOADED(joaat(ArgsTable.Vehicles[k].VehiclesT[i].Model)) then
                                            local OldCoords = ENTITY.GET_ENTITY_COORDS(ArgsTable.Vehicles[k].VehiclesT[i].OldHandle)
                                            local OldHeading = ENTITY.GET_ENTITY_HEADING(ArgsTable.Vehicles[k].VehiclesT[i].OldHandle)
                                            local OldVelocity = ENTITY.GET_ENTITY_VELOCITY(ArgsTable.Vehicles[k].VehiclesT[i].OldHandle)
                                            local VehHandle = 0
                                            local EntNetID = 0
                                            util.spoof_script(ScriptName, function()
                                                VehHandle = entities.create_vehicle(joaat(ArgsTable.Vehicles[k].VehiclesT[i].Model), OldCoords, OldHeading)
                                                EntNetID = NetworkEntityVehicle(VehHandle)
                                            end)
                                            if EntNetID == 0 then
                                                NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(VehHandle)
                                                entities.delete_by_handle(VehHandle)
                                                ArgsTable.Vehicles[k].VehiclesT[i].Attempts = ArgsTable.Vehicles[k].VehiclesT[i].Attempts + 1
                                                if ArgsTable.Vehicles[k].VehiclesT[i].Attempts >= MaxCreateAttemps then
                                                    ArgsTable.Vehicles[k].VehiclesT[i].NetID = ArgsTable.Vehicles[k].VehiclesT[i].OldNetID
                                                    ArgsTable.Vehicles[k].VehiclesT[i].Handle = ArgsTable.Vehicles[k].VehiclesT[i].OldHandle
                                                    ArgsTable.Vehicles[k].VehiclesT[i].OldHandle = 0
                                                    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(joaat(ArgsTable.Vehicles[k].VehiclesT[i].Model))
                                                end
                                            else
                                                if ArgsTable.Vehicles[k].VehiclesT[i].UpgradeType == 1 then
                                                    local VehHealth = 5000
                                                    if ArgsTable.Vehicles[k].HealthToGive ~= nil then
                                                        VehHealth = ArgsTable.Vehicles[k].HealthToGive
                                                    end
                                                    if MoreSupplyVehHealth then
                                                        VehHealth = VehHealth + 500000
                                                    end
                                                    SetSupplyVehSettings(VehHandle, VehHealth)
                                                    VEHICLE.SET_VEHICLE_COLOURS(VehHandle, math.random(0, 160), math.random(0, 160))
                                                end
                                                if ArgsTable.Vehicles[k].VehiclesT[i].UpgradeType == 0 then
                                                    CopyVehSettingsToAnotherVeh(ArgsTable.Vehicles[k].VehiclesT[i].OldHandle, VehHandle)
                                                end
                                                ArgsTable.Vehicles[k].VehiclesT[i].NetID = EntNetID
                                                ArgsTable.Vehicles[k].VehiclesT[i].Handle = VehHandle
                                                STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(joaat(ArgsTable.Vehicles[k].VehiclesT[i].Model))
                                                ENTITY.SET_ENTITY_VELOCITY(VehHandle, OldVelocity.x, OldVelocity.y, OldVelocity.z)
                                            end
                                        end
                                    else
                                        ArgsTable.Vehicles[k].VehiclesT[i].NetID = ArgsTable.Vehicles[k].VehiclesT[i].OldNetID
                                        ArgsTable.Vehicles[k].VehiclesT[i].Handle = ArgsTable.Vehicles[k].VehiclesT[i].OldHandle
                                        ArgsTable.Vehicles[k].VehiclesT[i].OldHandle = 0
                                        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(joaat(ArgsTable.Vehicles[k].VehiclesT[i].Model))
                                    end
                                end
                                if ArgsTable.Vehicles[k].VehiclesT[i].NetID ~= 0 then
                                    memory.write_int(memory.script_local(ScriptName, ArgsTable.Vehicles[k].LocalAddr + ArgsTable.Vehicles[k].NextOffset * (i - ArgsTable.Vehicles[k].DecreaseI)), ArgsTable.Vehicles[k].VehiclesT[i].NetID)
                                    if ArgsTable.Vehicles[k].VehiclesT[i].OldHandle ~= 0 then
                                        for j = -1, 7 do
                                            local Passenger = VEHICLE.GET_PED_IN_VEHICLE_SEAT(ArgsTable.Vehicles[k].VehiclesT[i].OldHandle, j, false)
                                            if Passenger ~= 0 then
                                                if not PED.IS_PED_A_PLAYER(Passenger) then
                                                    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(Passenger)
                                                    if VEHICLE.IS_VEHICLE_SEAT_FREE(ArgsTable.Vehicles[k].VehiclesT[i].Handle, j, true) then
                                                        PED.SET_PED_INTO_VEHICLE(Passenger, ArgsTable.Vehicles[k].VehiclesT[i].Handle, j)
                                                    end
                                                end
                                            end
                                        end
                                        if NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ArgsTable.Vehicles[k].VehiclesT[i].OldHandle) then
                                            entities.delete_by_handle(ArgsTable.Vehicles[k].VehiclesT[i].OldHandle)
                                            ArgsTable.Vehicles[k].VehiclesT[i].OldHandle = 0
                                        end
                                    end
                                end
                                if ArgsTable.Vehicles[k].VehiclesT[i].Handle ~= 0 then
                                    if BringTargetsCloser then
                                        if ArgsTable.Vehicles[k].BringTargets ~= nil then
                                            local Blip = HUD.GET_BLIP_FROM_ENTITY(ArgsTable.Vehicles[k].VehiclesT[i].Handle)
                                            if Blip ~= 0 then
                                                local BlipSprite = HUD.GET_BLIP_SPRITE(Blip)
                                                local BlipColor = HUD.GET_BLIP_COLOUR(Blip)
                                                if BlipSprite == 429 then
                                                    if BlipColor == 1 or BlipColor == 59 then
                                                        if not ENTITY.IS_ENTITY_AT_ENTITY(ArgsTable.Vehicles[k].VehiclesT[i].Handle, PlayerPed, ArgsTable.Vehicles[k].BringTargets, ArgsTable.Vehicles[k].BringTargets, ArgsTable.Vehicles[k].BringTargets, false, true, 0) then
                                                            local OutPos, OutHeading, FoundCoords = FindRightSpawnVeh(PlPos.x, PlPos.y, PlPos.z, 10, ArgsTable.Vehicles[k].BringTargets)
                                                            if FoundCoords then
                                                                if not MISC.IS_POSITION_OCCUPIED(OutPos.x, OutPos.y, OutPos.z, 5.0, false, true, true, true, false, 0, true) then
                                                                    if NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ArgsTable.Vehicles[k].VehiclesT[i].Handle) then
                                                                        ENTITY.SET_ENTITY_COORDS(ArgsTable.Vehicles[k].VehiclesT[i].Handle, OutPos.x, OutPos.y, OutPos.z)
                                                                        ENTITY.SET_ENTITY_HEADING(ArgsTable.Vehicles[k].VehiclesT[i].Handle, OutHeading)
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                    if BringMissionCloser then
                                        local ExtraCondition = false
                                        if BringEntsLOSBased then
                                            ExtraCondition = not ENTITY.HAS_ENTITY_CLEAR_LOS_TO_ENTITY(ArgsTable.Vehicles[k].VehiclesT[i].Handle, PlayerPed, 17)
                                        end
                                        if not ENTITY.IS_ENTITY_AT_ENTITY(ArgsTable.Vehicles[k].VehiclesT[i].Handle, PlayerPed, DistToCheck, DistToCheck, DistToCheck, false, true, 0) or ExtraCondition then
                                            local CanSetCoords = true
                                            local Ped = VEHICLE.GET_PED_IN_VEHICLE_SEAT(ArgsTable.Vehicles[k].VehiclesT[i].Handle, -1, false)
                                            if Ped ~= 0 then
                                                if PED.IS_PED_A_PLAYER(Ped) then
                                                    CanSetCoords = false
                                                end
                                            end
                                            if CanSetCoords then
                                                local OutPos, OutHeading, FoundCoords = FindRightSpawnVeh(PlPos.x, PlPos.y, PlPos.z, 10, MaxDistToBring)
                                                if FoundCoords then
                                                    if not MISC.IS_POSITION_OCCUPIED(OutPos.x, OutPos.y, OutPos.z, 5.0, false, true, true, true, false, 0, true) then
                                                        if NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ArgsTable.Vehicles[k].VehiclesT[i].Handle) then
                                                            ENTITY.SET_ENTITY_COORDS(ArgsTable.Vehicles[k].VehiclesT[i].Handle, OutPos.x, OutPos.y, OutPos.z)
                                                            ENTITY.SET_ENTITY_HEADING(ArgsTable.Vehicles[k].VehiclesT[i].Handle, OutHeading)
                                                        end
                                                    end
                                                end
                                                if AddBlipForBringedEntity then
                                                    if ArgsTable.Vehicles[k].VehiclesT[i].BlipHandle == nil then
                                                        local Blip = HUD.GET_BLIP_FROM_ENTITY(ArgsTable.Vehicles[k].VehiclesT[i].Handle)
                                                        if Blip == 0 then
                                                            Blip = HUD.ADD_BLIP_FOR_ENTITY(ArgsTable.Vehicles[k].VehiclesT[i].Handle)
                                                            --HUD.SET_BLIP_SPRITE(Blip, 0)
                                                            HUD.SET_BLIP_COLOUR(Blip, 3)
                                                            ArgsTable.Vehicles[k].VehiclesT[i].BlipHandle = Blip
                                                        else
                                                            ArgsTable.Vehicles[k].VehiclesT[i].BlipHandle = Blip
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                    if InvincibleSupply then
                                        if ArgsTable.Vehicles[k].IsSupply ~= nil then
                                            if ArgsTable.Vehicles[k].IsSupply then
                                                ENTITY.SET_ENTITY_INVINCIBLE(ArgsTable.Vehicles[k].VehiclesT[i].Handle, true)
                                            end
                                        end
                                    end
                                    if ENTITY.IS_ENTITY_DEAD(ArgsTable.Vehicles[k].VehiclesT[i].Handle) or not ENTITY.DOES_ENTITY_EXIST(ArgsTable.Vehicles[k].VehiclesT[i].Handle) then -- or not ENTITY.IS_ENTITY_A_MISSION_ENTITY(ArgsTable.Vehicles[k].VehiclesT[i].Handle) then
                                        if ArgsTable.Vehicles[k].VehiclesT[i].BlipHandle ~= nil then
                                            util.remove_blip(ArgsTable.Vehicles[k].VehiclesT[i].BlipHandle)
                                        end
                                        ArgsTable.Vehicles[k].VehiclesT[i] = nil
                                    end
                                end
                            end
                        end
                    end
                    for j = 1, #ArgsTable.Peds do
                        for i = 1, ArgsTable.Peds[j].MaxLen do
                            if ArgsTable.Peds[j].PedsT[i] == nil then
                                local OldNetID = memory.read_int(memory.script_local(ScriptName, ArgsTable.Peds[j].LocalAddr + ArgsTable.Peds[j].NextOffset * (i - ArgsTable.Peds[j].DecreaseI)))
                                if OldNetID > 0 then
                                    local OldPedHandle = 0
                                    util.spoof_script(ScriptName, function()
                                        OldPedHandle = NETWORK.NET_TO_PED(OldNetID)
                                    end)
                                    if OldPedHandle ~= 0 then
                                        if not ENTITY.IS_ENTITY_DEAD(OldPedHandle) and ENTITY.IS_ENTITY_A_MISSION_ENTITY(OldPedHandle) then
                                            local PedModelToUse = ArgsTable.Peds[j].SelectedModels[math.random(#ArgsTable.Peds[j].SelectedModels)]
                                            local PedVeh = PED.GET_VEHICLE_PED_IS_IN(OldPedHandle, false)
                                            local SeatIndex = -2
                                            local PedSetts = 0
                                            if ArgsTable.Peds[j].PedSetts ~= nil then
                                                PedSetts = ArgsTable.Peds[j].PedSetts
                                            end
                                            if PedVeh ~= 0 then
                                                for k = -1, 7 do
                                                    local Passenger = VEHICLE.GET_PED_IN_VEHICLE_SEAT(PedVeh, k, false)
                                                    if Passenger == OldPedHandle then
                                                        SeatIndex = k
                                                    end
                                                end
                                                TASK.TASK_LEAVE_VEHICLE(OldPedHandle, PedVeh, 16)
                                            end
                                            local PedType = PED.GET_PED_TYPE(OldPedHandle)
                                            ArgsTable.Peds[j].PedsT[i] = {Model = PedModelToUse, NetID = 0, Handle = 0, OldHandle = OldPedHandle, OldVeh = PedVeh, SeatIndex = SeatIndex, PedType = PedType, PedSetts = PedSetts, OldNetID = OldNetID, Attempts = 0}
                                        end
                                    end
                                end
                            end
                            if ArgsTable.Peds[j].PedsT[i] ~= nil then
                                if ArgsTable.Peds[j].PedsT[i].NetID == 0 then
                                    if ArgsTable.Peds[j].PedsT[i].Attempts < MaxCreateAttemps then
                                        if not STREAMING.HAS_MODEL_LOADED(joaat(ArgsTable.Peds[j].PedsT[i].Model)) then
                                            STREAMING.REQUEST_MODEL(joaat(ArgsTable.Peds[j].PedsT[i].Model))
                                        end
                                        if STREAMING.HAS_MODEL_LOADED(joaat(ArgsTable.Peds[j].PedsT[i].Model)) then
                                            local PedType = ArgsTable.Peds[j].PedsT[i].PedType
                                            if ArgsTable.Peds[j].PedsT[i].OldVeh ~= 0 and ArgsTable.Peds[j].PedsT[i].SeatIndex ~= -2 then
                                                local PedHandle = 0
                                                local EntNetID = 0
                                                util.spoof_script(ScriptName, function()
                                                    PedHandle = PED.CREATE_PED_INSIDE_VEHICLE(ArgsTable.Peds[j].PedsT[i].OldVeh, PedType, joaat(ArgsTable.Peds[j].PedsT[i].Model), ArgsTable.Peds[j].PedsT[i].SeatIndex, true, true)
                                                    EntNetID = NetworkEntityPed(PedHandle)
                                                end)
                                                if EntNetID == 0 then
                                                    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(PedHandle)
                                                    entities.delete_by_handle(PedHandle)
                                                    ArgsTable.Peds[j].PedsT[i].Attempts = ArgsTable.Peds[j].PedsT[i].Attempts + 1
                                                    if ArgsTable.Peds[j].PedsT[i].Attempts >= MaxCreateAttemps then
                                                        ArgsTable.Peds[j].PedsT[i].NetID = ArgsTable.Peds[j].PedsT[i].OldNetID
                                                        ArgsTable.Peds[j].PedsT[i].Handle = ArgsTable.Peds[j].PedsT[i].OldHandle
                                                        ArgsTable.Peds[j].PedsT[i].OldHandle = 0
                                                        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(joaat(ArgsTable.Peds[j].PedsT[i].Model))
                                                    end
                                                else
                                                    ArgsTable.Peds[j].PedsT[i].NetID  = EntNetID
                                                    ArgsTable.Peds[j].PedsT[i].Handle = PedHandle
                                                    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(joaat(ArgsTable.Peds[j].PedsT[i].Model))
                                                    local RelHash = PED.GET_PED_RELATIONSHIP_GROUP_HASH(ArgsTable.Peds[j].PedsT[i].OldHandle)
                                                    PED.SET_PED_RELATIONSHIP_GROUP_HASH(PedHandle, RelHash)
                                                    if ArgsTable.Peds[j].PedsT[i].PedSetts == 0 then
                                                        local MaxHealth = ENTITY.GET_ENTITY_MAX_HEALTH(ArgsTable.Peds[j].PedsT[i].OldHandle)
                                                        local Health = ENTITY.GET_ENTITY_HEALTH(ArgsTable.Peds[j].PedsT[i].OldHandle)
                                                        ENTITY.SET_ENTITY_MAX_HEALTH(PedHandle, MaxHealth)
                                                        ENTITY.SET_ENTITY_HEALTH(PedHandle, Health)
                                                    end
                                                    if ArgsTable.Peds[j].PedsT[i].PedSetts == 1 then
                                                        CopyPedSettsToPed(ArgsTable.Peds[j].PedsT[i].OldHandle, PedHandle)
                                                        PED.SET_PED_COMBAT_ATTRIBUTES(PedHandle, 5, true)
                                                        PED.SET_PED_COMBAT_ATTRIBUTES(PedHandle, 17, false)
                                                    end
                                                    if ArgsTable.Peds[j].PedsT[i].PedSetts == 2 then
                                                        CopyPedSettsToPed(ArgsTable.Peds[j].PedsT[i].OldHandle, PedHandle)
                                                        SetRandomPedSetts(PedHandle)
                                                    end
                                                    if ArgsTable.Peds[j].PedsT[i].PedSetts == 3 then
                                                        CopyPedSettsToPed(ArgsTable.Peds[j].PedsT[i].OldHandle, PedHandle)
                                                        WEAPON.GIVE_WEAPON_TO_PED(PedHandle, joaat(WeapsList[math.random(#WeapsList)]), 99999, false, true)
                                                        PED.SET_PED_COMBAT_ATTRIBUTES(PedHandle, 5, true)
                                                        PED.SET_PED_COMBAT_ATTRIBUTES(PedHandle, 5, 17)
                                                    end
                                                    if ArgsTable.Peds[j].PedsT[i].PedSetts == 4 then
                                                        CopyPedSettsToPed(ArgsTable.Peds[j].PedsT[i].OldHandle, PedHandle)
                                                        WEAPON.GIVE_WEAPON_TO_PED(PedHandle, joaat(WeapsList[math.random(#WeapsList)]), 99999, false, true)
                                                        PED.SET_PED_COMBAT_ATTRIBUTES(PedHandle, 5, true)
                                                        PED.SET_PED_COMBAT_ATTRIBUTES(PedHandle, 5, 17)
                                                        SetPedCombatAbilities(PedHandle)
                                                        ENTITY.SET_ENTITY_MAX_HEALTH(PedHandle, 10000)
                                                        PED.SET_PED_MAX_HEALTH(PedHandle, 10000)
                                                        ENTITY.SET_ENTITY_HEALTH(PedHandle, 10000)
                                                        PED.SET_PED_SUFFERS_CRITICAL_HITS(PedHandle, false)
                                                        PED.SET_PED_CONFIG_FLAG(PedHandle, 188, true)
                                                    end
                                                end
                                            else
                                                local OldCoords = ENTITY.GET_ENTITY_COORDS(ArgsTable.Peds[j].PedsT[i].OldHandle)
                                                local OldHeading = ENTITY.GET_ENTITY_HEADING(ArgsTable.Peds[j].PedsT[i].OldHandle)
                                                local OldVelocity = ENTITY.GET_ENTITY_VELOCITY(ArgsTable.Peds[j].PedsT[i].OldHandle)
                                                local PedHandle = 0
                                                local EntNetID = 0
                                                util.spoof_script(ScriptName, function()
                                                    PedHandle = entities.create_ped(PedType, joaat(ArgsTable.Peds[j].PedsT[i].Model), OldCoords, OldHeading)
                                                    EntNetID = NetworkEntityPed(PedHandle)
                                                end)
                                                if EntNetID == 0 then
                                                    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(PedHandle)
                                                    entities.delete_by_handle(PedHandle)
                                                else
                                                    ArgsTable.Peds[j].PedsT[i].NetID = EntNetID
                                                    ArgsTable.Peds[j].PedsT[i].Handle = PedHandle
                                                    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(joaat(ArgsTable.Peds[j].PedsT[i].Model))
                                                    ENTITY.SET_ENTITY_VELOCITY(PedHandle, OldVelocity.x, OldVelocity.y, OldVelocity.z)
                                                    local RelHash = PED.GET_PED_RELATIONSHIP_GROUP_HASH(ArgsTable.Peds[j].PedsT[i].OldHandle)
                                                    PED.SET_PED_RELATIONSHIP_GROUP_HASH(PedHandle, RelHash)
                                                    if ArgsTable.Peds[j].PedsT[i].PedSetts == 0 then
                                                        local MaxHealth = ENTITY.GET_ENTITY_MAX_HEALTH(ArgsTable.Peds[j].PedsT[i].OldHandle)
                                                        local Health = ENTITY.GET_ENTITY_HEALTH(ArgsTable.Peds[j].PedsT[i].OldHandle)
                                                        ENTITY.SET_ENTITY_MAX_HEALTH(PedHandle, MaxHealth)
                                                        ENTITY.SET_ENTITY_HEALTH(PedHandle, Health)
                                                    end
                                                    if ArgsTable.Peds[j].PedsT[i].PedSetts == 1 then
                                                        CopyPedSettsToPed(ArgsTable.Peds[j].PedsT[i].OldHandle, PedHandle)
                                                        PED.SET_PED_COMBAT_ATTRIBUTES(PedHandle, 5, true)
                                                        PED.SET_PED_COMBAT_ATTRIBUTES(PedHandle, 17, false)
                                                    end
                                                    if ArgsTable.Peds[j].PedsT[i].PedSetts == 2 then
                                                        CopyPedSettsToPed(ArgsTable.Peds[j].PedsT[i].OldHandle, PedHandle)
                                                        SetRandomPedSetts(PedHandle)
                                                    end
                                                    if ArgsTable.Peds[j].PedsT[i].PedSetts == 3 then
                                                        CopyPedSettsToPed(ArgsTable.Peds[j].PedsT[i].OldHandle, PedHandle)
                                                        WEAPON.GIVE_WEAPON_TO_PED(PedHandle, joaat(WeapsList[math.random(#WeapsList)]), 99999, false, true)
                                                        PED.SET_PED_COMBAT_ATTRIBUTES(PedHandle, 5, true)
                                                        PED.SET_PED_COMBAT_ATTRIBUTES(PedHandle, 5, 17)
                                                    end
                                                    if ArgsTable.Peds[j].PedsT[i].PedSetts == 4 then
                                                        CopyPedSettsToPed(ArgsTable.Peds[j].PedsT[i].OldHandle, PedHandle)
                                                        WEAPON.GIVE_WEAPON_TO_PED(PedHandle, joaat("weapon_appistol"), 99999, false, true)
                                                        WEAPON.GIVE_WEAPON_TO_PED(PedHandle, joaat(WeapsList[math.random(#WeapsList)]), 99999, false, true)
                                                        PED.SET_PED_COMBAT_ATTRIBUTES(PedHandle, 5, true)
                                                        PED.SET_PED_COMBAT_ATTRIBUTES(PedHandle, 5, 17)
                                                        SetPedCombatAbilities(PedHandle)
                                                        ENTITY.SET_ENTITY_MAX_HEALTH(PedHandle, 10000)
                                                        PED.SET_PED_MAX_HEALTH(PedHandle, 10000)
                                                        ENTITY.SET_ENTITY_HEALTH(PedHandle, 10000)
                                                        PED.SET_PED_SUFFERS_CRITICAL_HITS(PedHandle, false)
                                                        PED.SET_PED_CONFIG_FLAG(PedHandle, 188, true)
                                                    end
                                                end
                                            end
                                        end
                                    else
                                        ArgsTable.Peds[j].PedsT[i].NetID = ArgsTable.Peds[j].PedsT[i].OldNetID
                                        ArgsTable.Peds[j].PedsT[i].Handle = ArgsTable.Peds[j].PedsT[i].OldHandle
                                        ArgsTable.Peds[j].PedsT[i].OldHandle = 0
                                        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(joaat(ArgsTable.Peds[j].PedsT[i].Model))
                                    end
                                end
                                if ArgsTable.Peds[j].PedsT[i].NetID ~= 0 then
                                    memory.write_int(memory.script_local(ScriptName, ArgsTable.Peds[j].LocalAddr + ArgsTable.Peds[j].NextOffset * (i - ArgsTable.Peds[j].DecreaseI)), ArgsTable.Peds[j].PedsT[i].NetID)
                                    if ArgsTable.Peds[j].PedsT[i].OldHandle ~= 0 then
                                        if NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ArgsTable.Peds[j].PedsT[i].OldHandle) then
                                            entities.delete_by_handle(ArgsTable.Peds[j].PedsT[i].OldHandle)
                                            ArgsTable.Peds[j].PedsT[i].OldHandle = 0
                                        end
                                    end
                                end
                                if ArgsTable.Peds[j].PedsT[i].Handle ~= 0 then
                                    if BringTargetsCloser then
                                        if ArgsTable.Peds[j].PedsT[i].BringTargets ~= nil then
                                            local Blip = HUD.GET_BLIP_FROM_ENTITY(ArgsTable.Peds[j].PedsT[i].Handle)
                                            if Blip ~= 0 then
                                                local BlipSprite = HUD.GET_BLIP_SPRITE(Blip)
                                                local BlipColor = HUD.GET_BLIP_COLOUR(Blip)
                                                if BlipSprite == 432 or BlipSprite == 429 then
                                                    if BlipColor == 1 or BlipColor == 59 then
                                                        if not ENTITY.IS_ENTITY_AT_ENTITY(ArgsTable.Peds[j].PedsT[i].Handle, PlayerPed, ArgsTable.Peds[j].PedsT[i].BringTargets, ArgsTable.Peds[j].PedsT[i].BringTargets, ArgsTable.Peds[j].PedsT[i].BringTargets, false, true, 0) then
                                                            if PED.IS_PED_IN_ANY_VEHICLE(ArgsTable.Peds[j].PedsT[i].Handle, false) then
                                                                local Veh = PED.GET_VEHICLE_PED_IS_IN(ArgsTable.Peds[j].PedsT[i].Handle, false)
                                                                if Veh ~= 0 then
                                                                    local OutPos, OutHeading, FoundCoords = FindRightSpawnVeh(PlPos.x, PlPos.y, PlPos.z, 10, ArgsTable.Peds[j].PedsT[i].BringTargets)
                                                                    if FoundCoords then
                                                                        if not MISC.IS_POSITION_OCCUPIED(OutPos.x, OutPos.y, OutPos.z, 1.0, false, true, true, true, false, 0, true) then
                                                                            if NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(Veh) then
                                                                                ENTITY.SET_ENTITY_COORDS(Veh, OutPos.x, OutPos.y, OutPos.z)
                                                                                ENTITY.SET_ENTITY_HEADING(Veh, OutHeading)
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            else
                                                                local OutPos, FoundCoords = FindRightSpawnPed(PlPos.x, PlPos.y, PlPos.z, 10, ArgsTable.Peds[j].PedsT[i].BringTargets)
                                                                if FoundCoords then
                                                                    if not MISC.IS_POSITION_OCCUPIED(OutPos.x, OutPos.y, OutPos.z, 0.5, false, true, true, true, false, 0, true) then
                                                                        if NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ArgsTable.Peds[j].PedsT[i].Handle) then
                                                                            ENTITY.SET_ENTITY_COORDS(ArgsTable.Peds[j].PedsT[i].Handle, OutPos.x, OutPos.y, OutPos.z)
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                    if BringMissionCloser then
                                        local ExtraCondition = false
                                        if BringEntsLOSBased then
                                            ExtraCondition = not ENTITY.HAS_ENTITY_CLEAR_LOS_TO_ENTITY(ArgsTable.Peds[j].PedsT[i].Handle, PlayerPed, 17)
                                        end
                                        if not ENTITY.IS_ENTITY_AT_ENTITY(ArgsTable.Peds[j].PedsT[i].Handle, PlayerPed, DistToCheck, DistToCheck, DistToCheck, false, true, 0) or ExtraCondition then
                                            if PED.IS_PED_IN_ANY_VEHICLE(ArgsTable.Peds[j].PedsT[i].Handle, false) then
                                                local Veh = PED.GET_VEHICLE_PED_IS_IN(ArgsTable.Peds[j].PedsT[i].Handle, false)
                                                if Veh ~= 0 then
                                                    local OutPos, OutHeading, FoundCoords = FindRightSpawnVeh(PlPos.x, PlPos.y, PlPos.z, 10, MaxDistToBring)
                                                    if FoundCoords then
                                                        if not MISC.IS_POSITION_OCCUPIED(OutPos.x, OutPos.y, OutPos.z, 5.0, false, true, true, true, false, 0, true) then
                                                            if NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(Veh) then
                                                                ENTITY.SET_ENTITY_COORDS(Veh, OutPos.x, OutPos.y, OutPos.z)
                                                                ENTITY.SET_ENTITY_HEADING(Veh, OutHeading)
                                                            end
                                                        end
                                                    end
                                                end
                                            else
                                                local OutPos, FoundCoords = FindRightSpawnPed(PlPos.x, PlPos.y, PlPos.z, 10, MaxDistToBring)
                                                if FoundCoords then
                                                    if not MISC.IS_POSITION_OCCUPIED(OutPos.x, OutPos.y, OutPos.z, 0.5, false, true, true, true, false, 0, true) then
                                                        if NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ArgsTable.Peds[j].PedsT[i].Handle) then
                                                            ENTITY.SET_ENTITY_COORDS(ArgsTable.Peds[j].PedsT[i].Handle, OutPos.x, OutPos.y, OutPos.z)
                                                        end
                                                    end
                                                end
                                            end
                                            if AddBlipForBringedEntity then
                                                if not HUD.DOES_PED_HAVE_AI_BLIP(ArgsTable.Peds[j].PedsT[i].Handle) then
                                                    HUD.SET_PED_HAS_AI_BLIP_WITH_COLOUR(ArgsTable.Peds[j].PedsT[i].Handle, true, 1)
                                                    HUD.SET_PED_AI_BLIP_HAS_CONE(ArgsTable.Peds[j].PedsT[i].Handle, false)
                                                    HUD.SET_PED_AI_BLIP_FORCED_ON(ArgsTable.Peds[j].PedsT[i].Handle, true)
                                                end
                                            end
                                        end
                                    end
                                    if ENTITY.IS_ENTITY_DEAD(ArgsTable.Peds[j].PedsT[i].Handle) or not ENTITY.DOES_ENTITY_EXIST(ArgsTable.Peds[j].PedsT[i].Handle) then -- or not ENTITY.IS_ENTITY_A_MISSION_ENTITY(ArgsTable.Peds[j].PedsT[i].Handle) then
                                        if ArgsTable.Peds[j].PedsT[i].BlipHandle ~= nil then
                                            util.remove_blip(ArgsTable.Peds[j].PedsT[i].BlipHandle)
                                        end
                                        ArgsTable.Peds[j].PedsT[i] = nil
                                    end
                                end
                            end
                        end
                    end
                    for j = 1, #ArgsTable.Objects do
                        for i = 1, ArgsTable.Objects[j].MaxLen do
                            if ArgsTable.Objects[j].SpawnObjectsT ~= nil then
                                if CreateSupplies then
                                    if ArgsTable.Objects[j].SpawnObjectsT[i] == nil then
                                        local OldNetID = memory.read_int(memory.script_local(ScriptName, ArgsTable.Objects[j].LocalAddr + ArgsTable.Objects[j].NextOffset * (i - ArgsTable.Objects[j].DecreaseI)))
                                        if OldNetID == 0 then
                                            local ObjModelToUse = ArgsTable.Objects[j].SelectedModels[math.random(#ArgsTable.Objects[j].SelectedModels)]
                                            ArgsTable.Objects[j].SpawnObjectsT[i] = {}
                                            ArgsTable.Objects[j].SpawnObjectsT[i].Tick = 0
                                            ArgsTable.Objects[j].SpawnObjectsT[i].Model = ObjModelToUse
                                        end
                                    end
                                    if ArgsTable.Objects[j].SpawnObjectsT[i] ~= nil then
                                        if ArgsTable.Objects[j].SpawnObjectsT[i].Tick ~= nil then
                                            local OldNetID = memory.read_int(memory.script_local(ScriptName, ArgsTable.Objects[j].LocalAddr + ArgsTable.Objects[j].NextOffset * (i - ArgsTable.Objects[j].DecreaseI)))
                                            if OldNetID == 0 then
                                                ArgsTable.Objects[j].SpawnObjectsT[i].Tick = ArgsTable.Objects[j].SpawnObjectsT[i].Tick + 1
                                                if ArgsTable.Objects[j].SpawnObjectsT[i].Tick > MaxZeroTick then
                                                    ArgsTable.Objects[j].ObjectsT[i] = {Model = ArgsTable.Objects[j].SpawnObjectsT[i].Model, NetID = 0, Handle = 0, OldHandle = 0, OldNetID = 0, Attempts = 0}
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                            if ArgsTable.Objects[j].ObjectsT[i] == nil then
                                local OldNetID = memory.read_int(memory.script_local(ScriptName, ArgsTable.Objects[j].LocalAddr + ArgsTable.Objects[j].NextOffset * (i - ArgsTable.Objects[j].DecreaseI)))
                                if OldNetID > 0 then
                                    local OldObjHandle = 0
                                    util.spoof_script(ScriptName, function()
                                        OldObjHandle = NETWORK.NET_TO_OBJ(OldNetID)
                                    end)
                                    if OldObjHandle ~= 0 then
                                        local EntType = ENTITY.GET_ENTITY_TYPE(OldObjHandle)
                                        if EntType == 3 then
                                            if not ENTITY.IS_ENTITY_ATTACHED_TO_ANY_PED(OldObjHandle) then
                                                --if OBJECT.IS_OBJECT_A_PORTABLE_PICKUP(OldObjHandle) then
                                                    local ObjModelToUse = ArgsTable.Objects[j].SelectedModels[math.random(#ArgsTable.Objects[j].SelectedModels)]
                                                    local HandleToSet = 0
                                                    local OldHandleToSet = OldObjHandle
                                                    local NetIDToSet = 0
                                                    if ArgsTable.Objects[j].DisabledModels ~= nil then
                                                        local EntModel = ENTITY.GET_ENTITY_MODEL(OldObjHandle)
                                                        for k = 1, #ArgsTable.Objects[j].DisabledVehs do
                                                            if EntModel == joaat(ArgsTable.Objects[j].DisabledModels[k].Model1) then
                                                                if ArgsTable.Objects[j].DisabledModels[k].Model2 ~= nil then
                                                                    ObjModelToUse = ArgsTable.Objects[j].DisabledModels[k].Model2
                                                                    if ArgsTable.Objects[j].DisabledModels[k].Model1 == ArgsTable.Objects[j].DisabledModels[k].Model2 then
                                                                        HandleToSet = OldObjHandle
                                                                        NetIDToSet = OldNetID
                                                                        OldHandleToSet = 0
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                    ArgsTable.Objects[j].ObjectsT[i] = {Model = ObjModelToUse, NetID = NetIDToSet, Handle = HandleToSet, OldHandle = OldHandleToSet, OldNetID = OldNetID, Attempts = 0}
                                                --end
                                            end
                                        end
                                    end
                                end
                            end
                            if ArgsTable.Objects[j].ObjectsT[i] ~= nil then
                                if ArgsTable.Objects[j].ObjectsT[i].NetID == 0 then
                                    if ArgsTable.Objects[j].ObjectsT[i].Attempts < MaxCreateAttemps then
                                        if not STREAMING.HAS_MODEL_LOADED(joaat(ArgsTable.Objects[j].ObjectsT[i].Model)) then
                                            STREAMING.REQUEST_MODEL(joaat(ArgsTable.Objects[j].ObjectsT[i].Model))
                                        end
                                        if STREAMING.HAS_MODEL_LOADED(joaat(ArgsTable.Objects[j].ObjectsT[i].Model)) then
                                            local OldCoords = nil
                                            local OldHeading = nil
                                            if ArgsTable.Objects[j].ObjectsT[i].OldHandle ~= 0 then
                                                OldCoords = ENTITY.GET_ENTITY_COORDS(ArgsTable.Objects[j].ObjectsT[i].OldHandle)
                                                OldHeading = ENTITY.GET_ENTITY_HEADING(ArgsTable.Objects[j].ObjectsT[i].OldHandle)
                                            else
                                                OldCoords = ENTITY.GET_ENTITY_COORDS(PlayerPed)
                                                OldHeading = ENTITY.GET_ENTITY_HEADING(PlayerPed)
                                                local FVect = ENTITY.GET_ENTITY_FORWARD_VECTOR(PlayerPed)
                                                OldCoords.x = OldCoords.x + FVect.x * 3.0
                                                OldCoords.y = OldCoords.y + FVect.y * 3.0
                                                OldCoords.z = OldCoords.z + FVect.z * 3.0
                                            end
                                            --local OldCoords = ENTITY.GET_ENTITY_COORDS(ObjectsT[i].OldHandle)
                                            --local OldHeading = ENTITY.GET_ENTITY_HEADING(ObjectsT[i].OldHandle)
                                            local ObjHandle = 0
                                            local EntNetID = 0
                                            util.spoof_script(ScriptName, function()
                                                ObjHandle = OBJECT.CREATE_PORTABLE_PICKUP(joaat("PICKUP_PORTABLE_CRATE_FIXED_INCAR"), OldCoords.x, OldCoords.y, OldCoords.z, true, joaat(ArgsTable.Objects[j].ObjectsT[i].Model))
                                                EntNetID = NetworkEntityVehicle(ObjHandle)
                                            end)
                                            if EntNetID == 0 then
                                                NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ObjHandle)
                                                entities.delete_by_handle(ObjHandle)
                                                STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(joaat(ArgsTable.Objects[j].ObjectsT[i].Model))
                                                ArgsTable.Objects[j].ObjectsT[i].Attempts = ArgsTable.Objects[j].ObjectsT[i].Attempts + 1
                                                if ArgsTable.Objects[j].ObjectsT[i].Attempts >= MaxCreateAttemps then
                                                    ArgsTable.Objects[j].ObjectsT[i].NetID = ArgsTable.Objects[j].ObjectsT[i].OldNetID
                                                    ArgsTable.Objects[j].ObjectsT[i].Handle = ArgsTable.Objects[j].ObjectsT[i].OldHandle
                                                    ArgsTable.Objects[j].ObjectsT[i].OldHandle = 0
                                                    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(joaat(ArgsTable.Objects[j].ObjectsT[i].Model))
                                                end
                                            else
                                                ArgsTable.Objects[j].ObjectsT[i].NetID = EntNetID
                                                ArgsTable.Objects[j].ObjectsT[i].Handle = ObjHandle
                                                STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(joaat(ArgsTable.Objects[j].ObjectsT[i].Model))
                                                ENTITY.SET_ENTITY_HEADING(ObjHandle, OldHeading)
                                                ENTITY.FREEZE_ENTITY_POSITION(ObjHandle, false)
                                            end
                                        end
                                    else
                                        ArgsTable.Objects[j].ObjectsT[i].NetID = ArgsTable.Objects[j].ObjectsT[i].OldNetID
                                        ArgsTable.Objects[j].ObjectsT[i].Handle = ArgsTable.Objects[j].ObjectsT[i].OldHandle
                                        ArgsTable.Objects[j].ObjectsT[i].OldHandle = 0
                                        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(joaat(ArgsTable.Objects[j].ObjectsT[i].Model))
                                    end
                                end
                                if ArgsTable.Objects[j].ObjectsT[i].NetID ~= 0 then
                                    memory.write_int(memory.script_local(ScriptName, ArgsTable.Objects[j].LocalAddr + ArgsTable.Objects[j].NextOffset * (i - ArgsTable.Objects[j].DecreaseI)), ArgsTable.Objects[j].ObjectsT[i].NetID)
                                    if ArgsTable.Objects[j].ObjectsT[i].OldHandle ~= 0 then
                                        if NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ArgsTable.Objects[j].ObjectsT[i].OldHandle) then
                                            entities.delete_by_handle(ArgsTable.Objects[j].ObjectsT[i].OldHandle)
                                            ArgsTable.Objects[j].ObjectsT[i].OldHandle = 0
                                        end
                                    end
                                end
                                if ArgsTable.Objects[j].ObjectsT[i].Handle ~= 0 then
                                    if BringMissionCloser then
                                        if not ENTITY.IS_ENTITY_ATTACHED_TO_ANY_PED(ArgsTable.Objects[j].ObjectsT[i].Handle) then
                                            local ExtraCondition = false
                                            if BringEntsLOSBased then
                                                ExtraCondition = not ENTITY.HAS_ENTITY_CLEAR_LOS_TO_ENTITY(ArgsTable.Objects[j].ObjectsT[i].Handle, PlayerPed, 17)
                                            end
                                            if not ENTITY.IS_ENTITY_AT_ENTITY(ArgsTable.Objects[j].ObjectsT[i].Handle, PlayerPed, DistToCheck, DistToCheck, DistToCheck, false, true, 0) or ExtraCondition then
                                                local OutPos2, FoundCoords2 = FindRightSpawnPed(PlPos.x, PlPos.y, PlPos.z, 10, MaxDistToBring)
                                                if FoundCoords2 then
                                                    if not MISC.IS_POSITION_OCCUPIED(OutPos2.x, OutPos2.y, OutPos2.z, 0.5, false, true, true, true, false, PlayerPed, false) then
                                                        if NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ArgsTable.Objects[j].ObjectsT[i].Handle) then
                                                            ENTITY.SET_ENTITY_COORDS(ArgsTable.Objects[j].ObjectsT[i].Handle, OutPos2.x, OutPos2.y, OutPos2.z)
                                                        end
                                                    else
                                                        local OutPos, OutHeading, FoundCoords = FindRightSpawnVeh(PlPos.x, PlPos.y, PlPos.z, 10, MaxDistToBring)
                                                        if FoundCoords then
                                                            if not MISC.IS_POSITION_OCCUPIED(OutPos.x, OutPos.y, OutPos.z, 0.5, false, true, true, true, false, PlayerPed, false) then
                                                                if NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ArgsTable.Objects[j].ObjectsT[i].Handle) then
                                                                    ENTITY.SET_ENTITY_COORDS(ArgsTable.Objects[j].ObjectsT[i].Handle, OutPos.x, OutPos.y, OutPos.z)
                                                                    ENTITY.SET_ENTITY_HEADING(ArgsTable.Objects[j].ObjectsT[i].Handle, OutHeading)
                                                                end
                                                            end
                                                        end
                                                    end
                                                else
                                                    local OutPos, OutHeading, FoundCoords = FindRightSpawnVeh(PlPos.x, PlPos.y, PlPos.z, 10, MaxDistToBring)
                                                    if FoundCoords then
                                                        if not MISC.IS_POSITION_OCCUPIED(OutPos.x, OutPos.y, OutPos.z, 0.5, false, true, true, true, false, PlayerPed, false) then
                                                            if NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ArgsTable.Objects[j].ObjectsT[i].Handle) then
                                                                ENTITY.SET_ENTITY_COORDS(ArgsTable.Objects[j].ObjectsT[i].Handle, OutPos.x, OutPos.y, OutPos.z)
                                                                ENTITY.SET_ENTITY_HEADING(ArgsTable.Objects[j].ObjectsT[i].Handle, OutHeading)
                                                            end
                                                        end
                                                    end
                                                end
                                                if AddBlipForBringedEntity then
                                                    if ArgsTable.Objects[j].ObjectsT[i].BlipHandle == nil then
                                                        local Blip = HUD.GET_BLIP_FROM_ENTITY(ArgsTable.Objects[j].ObjectsT[i].Handle)
                                                        if Blip == 0 then
                                                            Blip = HUD.ADD_BLIP_FOR_ENTITY(ArgsTable.Objects[j].ObjectsT[i].Handle)
                                                            HUD.SET_BLIP_SPRITE(Blip, 586)
                                                            HUD.SET_BLIP_COLOUR(Blip, 2)
                                                            ArgsTable.Objects[j].ObjectsT[i].BlipHandle = Blip
                                                        else
                                                            ArgsTable.Objects[j].ObjectsT[i].BlipHandle = Blip
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                    if InvincibleSupply then
                                        if ArgsTable.Objects[j].IsSupply ~= nil then
                                            if ArgsTable.Objects[j].IsSupply then
                                                ENTITY.SET_ENTITY_INVINCIBLE(ArgsTable.Objects[j].ObjectsT[i].Handle, true)
                                            end
                                        end
                                    end
                                    if ENTITY.IS_ENTITY_DEAD(ArgsTable.Objects[j].ObjectsT[i].Handle) or not ENTITY.DOES_ENTITY_EXIST(ArgsTable.Objects[j].ObjectsT[i].Handle) then --or not ENTITY.IS_ENTITY_A_MISSION_ENTITY(ArgsTable.Objects[j].ObjectsT[i].Handle) then
                                        if ArgsTable.Objects[j].ObjectsT[i].BlipHandle ~= nil then
                                            util.remove_blip(ArgsTable.Objects[j].ObjectsT[i].BlipHandle)
                                        end
                                        ArgsTable.Objects[j].ObjectsT[i] = nil
                                    end
                                end
                            end
                        end
                    end
                    if ArgsTable.PropsToBring ~= nil then
                        for j = 1, #ArgsTable.PropsToBring do
                            for i = 1, ArgsTable.PropsToBring[j].MaxLen do
                                if ArgsTable.PropsToBring[j].PropsT[i] == nil then
                                    local OldNetID = memory.read_int(memory.script_local(ScriptName, ArgsTable.PropsToBring[j].LocalAddr + ArgsTable.PropsToBring[j].NextOffset * (i - ArgsTable.PropsToBring[j].DecreaseI)))
                                    if OldNetID > 0 then
                                        local OldObjHandle = 0
                                        util.spoof_script(ScriptName, function()
                                            OldObjHandle = NETWORK.NET_TO_OBJ(OldNetID)
                                        end)
                                        if OldObjHandle ~= 0 then
                                            local EntType = ENTITY.GET_ENTITY_TYPE(OldObjHandle)
                                            if EntType == 3 then
                                                if not ENTITY.IS_ENTITY_ATTACHED(OldObjHandle) then
                                                    ArgsTable.PropsToBring[j].PropsT[i] = {NetID = OldNetID, Handle = OldObjHandle}
                                                end
                                            end
                                        end
                                    end
                                end
                                if ArgsTable.PropsToBring[j].PropsT[i] ~= nil then
                                    if ArgsTable.PropsToBring[j].PropsT[i].Handle ~= 0 then
                                        if BringPropsCloser then
                                            if not ENTITY.IS_ENTITY_ATTACHED_TO_ANY_PED(ArgsTable.PropsToBring[j].PropsT[i].Handle) then
                                                local ExtraCondition = false
                                                if BringEntsLOSBased then
                                                    ExtraCondition = not ENTITY.HAS_ENTITY_CLEAR_LOS_TO_ENTITY(ArgsTable.PropsToBring[j].PropsT[i].Handle, PlayerPed, 17)
                                                end
                                                if not ENTITY.IS_ENTITY_AT_ENTITY(ArgsTable.PropsToBring[j].PropsT[i].Handle, PlayerPed, DistToCheck, DistToCheck, DistToCheck, false, true, 0) or ExtraCondition then
                                                    local OutPos2, FoundCoords2 = FindRightSpawnPed(PlPos.x, PlPos.y, PlPos.z, 10, MaxDistToBring)
                                                    if FoundCoords2 then
                                                        if not MISC.IS_POSITION_OCCUPIED(OutPos2.x, OutPos2.y, OutPos2.z, 0.5, false, true, true, true, false, PlayerPed, false) then
                                                            if NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ArgsTable.PropsToBring[j].PropsT[i].Handle) then
                                                                ENTITY.SET_ENTITY_COORDS(ArgsTable.PropsToBring[j].PropsT[i].Handle, OutPos2.x, OutPos2.y, OutPos2.z)
                                                            end
                                                        else
                                                            local OutPos, OutHeading, FoundCoords = FindRightSpawnVeh(PlPos.x, PlPos.y, PlPos.z, 10, MaxDistToBring)
                                                            if FoundCoords then
                                                                if not MISC.IS_POSITION_OCCUPIED(OutPos.x, OutPos.y, OutPos.z, 0.5, false, true, true, true, false, PlayerPed, false) then
                                                                    if NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ArgsTable.PropsToBring[j].PropsT[i].Handle) then
                                                                        ENTITY.SET_ENTITY_COORDS(ArgsTable.PropsToBring[j].PropsT[i].Handle, OutPos.x, OutPos.y, OutPos.z)
                                                                        ENTITY.SET_ENTITY_HEADING(ArgsTable.PropsToBring[j].PropsT[i].Handle, OutHeading)
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    else
                                                        local OutPos, OutHeading, FoundCoords = FindRightSpawnVeh(PlPos.x, PlPos.y, PlPos.z, 10, MaxDistToBring)
                                                        if FoundCoords then
                                                            if not MISC.IS_POSITION_OCCUPIED(OutPos.x, OutPos.y, OutPos.z, 0.5, false, true, true, true, false, PlayerPed, false) then
                                                                if NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ArgsTable.PropsToBring[j].PropsT[i].Handle) then
                                                                    ENTITY.SET_ENTITY_COORDS(ArgsTable.PropsToBring[j].PropsT[i].Handle, OutPos.x, OutPos.y, OutPos.z)
                                                                    ENTITY.SET_ENTITY_HEADING(ArgsTable.PropsToBring[j].PropsT[i].Handle, OutHeading)
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                        if ENTITY.IS_ENTITY_DEAD(ArgsTable.PropsToBring[j].PropsT[i].Handle) or not ENTITY.DOES_ENTITY_EXIST(ArgsTable.PropsToBring[j].PropsT[i].Handle) then -- or not ENTITY.IS_ENTITY_A_MISSION_ENTITY(ArgsTable.PropsToBring[j].PropsT[i].Handle) then
                                            if ArgsTable.PropsToBring[j].PropsT[i].BlipHandle ~= nil then
                                                util.remove_blip(ArgsTable.PropsToBring[j].PropsT[i].BlipHandle)
                                            end
                                            ArgsTable.PropsToBring[j].PropsT[i] = nil
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        else
            if ArgsTable.LocalToEditT ~= nil then
                if ArgsTable.LocalToEditT.Tick > 0 then
                    ArgsTable.LocalToEditT.Tick = 0
                end
            end
            for k = 1, #ArgsTable.Vehicles do
                for i = 1, ArgsTable.Vehicles[k].MaxLen do
                    if ArgsTable.Vehicles[k].VehiclesT[i] ~= nil then
                        if ArgsTable.Vehicles[k].VehiclesT[i].BlipHandle ~= nil then
                            util.remove_blip(ArgsTable.Vehicles[k].VehiclesT[i].BlipHandle)
                        end
                        ArgsTable.Vehicles[k].VehiclesT[i] = nil
                    end
                end
            end
            for k = 1, #ArgsTable.Peds do
                for i = 1, ArgsTable.Peds[k].MaxLen do
                    if ArgsTable.Peds[k].PedsT[i] ~= nil then
                        if ArgsTable.Peds[k].PedsT[i].BlipHandle ~= nil then
                            util.remove_blip(ArgsTable.Peds[k].PedsT[i].BlipHandle)
                        end
                        ArgsTable.Peds[k].PedsT[i] = nil
                    end
                end
            end
            for k = 1, #ArgsTable.Objects do
                for i = 1, ArgsTable.Objects[k].MaxLen do
                    if ArgsTable.Objects[k].ObjectsT[i] ~= nil then
                        if ArgsTable.Objects[k].ObjectsT[i].BlipHandle ~= nil then
                            util.remove_blip(ArgsTable.Objects[k].ObjectsT[i].BlipHandle)
                        end
                        ArgsTable.Objects[k].ObjectsT[i] = nil
                    end
                end
            end
            if ArgsTable.PropsToBring ~= nil then
                for k = 1, #ArgsTable.PropsToBring do
                    for i = 1, ArgsTable.PropsToBring[k].MaxLen do
                        if ArgsTable.PropsToBring[k].PropsT[i] ~= nil then
                            if ArgsTable.PropsToBring[k].PropsT[i].BlipHandle ~= nil then
                                util.remove_blip(ArgsTable.PropsToBring[k].PropsT[i].BlipHandle)
                            end
                            ArgsTable.PropsToBring[k].PropsT[i] = nil
                        end
                    end
                end
            end
        end
    end
end

function FindRightSpawnVeh(PosX, PosY, PosZ, MinDist, MaxDist)
	local OutPos = v3.new()
	local OutHeading = memory.alloc(4)
	--local FoundCoord = PATHFIND.GET_CLOSEST_VEHICLE_NODE_WITH_HEADING(PosX + (math.random() < 0.5 and math.random(-MaxDist, -MinDist) or math.random(MinDist, MaxDist)), PosY + (math.random() < 0.5 and math.random(-MaxDist, -MinDist) or math.random(MinDist, MaxDist)), PosZ, OutPos, OutHeading, 0, 3, 0)
	local FoundCoord = PATHFIND.GET_CLOSEST_VEHICLE_NODE_WITH_HEADING(PosX + (math.random() < 0.5 and math.random(-MaxDist, -MinDist) or math.random(MinDist, MaxDist)), PosY + (math.random() < 0.5 and math.random(-MaxDist, -MinDist) or math.random(MinDist, MaxDist)), PosZ, OutPos, OutHeading, 1, 3.0, 0.0)
    return OutPos, memory.read_float(OutHeading), FoundCoord
end

function FindRightSpawnPed(PosX, PosY, PosZ, MinDist, MaxDist)
	local OutPos = v3.new()
	local FoundCoord = PATHFIND.GET_SAFE_COORD_FOR_PED(PosX + (math.random() < 0.5 and math.random(-MaxDist, -MinDist) or math.random(MinDist, MaxDist)), PosY + (math.random() < 0.5 and math.random(-MaxDist, -MinDist) or math.random(MinDist, MaxDist)), PosZ, false, OutPos, 14)
	return OutPos, FoundCoord
end

function CopyPedSettsToPed(Ped, ToPed)
    local Accuracy = PED.GET_PED_ACCURACY(Ped)
    local Armour = PED.GET_PED_ARMOUR(Ped)
    local CMovement = PED.GET_PED_COMBAT_MOVEMENT(Ped)
    local CAngle = PED.GET_PED_VISUAL_FIELD_CENTER_ANGLE(Ped)
    PED.SET_PED_ACCURACY(ToPed, Accuracy)
    PED.SET_PED_ARMOUR(ToPed, Armour)
    PED.SET_PED_COMBAT_MOVEMENT(ToPed, CMovement)
    PED.SET_PED_VISUAL_FIELD_CENTER_ANGLE(ToPed, CAngle)
    local MaxHealth = ENTITY.GET_ENTITY_MAX_HEALTH(Ped)
	local Health = ENTITY.GET_ENTITY_HEALTH(Ped)
    ENTITY.SET_ENTITY_MAX_HEALTH(ToPed, MaxHealth)
	ENTITY.SET_ENTITY_HEALTH(ToPed, Health)
    for i = 0, 27 do
        local CombatFloat = PED.GET_COMBAT_FLOAT(Ped, i)
        PED.SET_COMBAT_FLOAT(Ped, i, CombatFloat)
    end
    for i = 20, 461 do
        local Flag = PED.GET_PED_CONFIG_FLAG(Ped, i, true)
        PED.SET_PED_CONFIG_FLAG(ToPed, i, Flag)
    end
    local BestWeap = WEAPON.GET_BEST_PED_WEAPON(Ped, false)
    if BestWeap ~= 0 then
        WEAPON.GIVE_WEAPON_TO_PED(ToPed, BestWeap, 99999, false, true)
    end
end

function SetRandomPedSetts(Ped)
    for i = 0, 90 do
        local Bool = false
        if math.random(0, 1) == 1 then
            Bool = true
        end
        if i == 5 then
            Bool = true
        end
        if i == 6 or i == 17 then
            Bool = false
        end
        PED.SET_PED_COMBAT_ATTRIBUTES(Ped, i, Bool)
    end
    WEAPON.GIVE_WEAPON_TO_PED(Ped, WeapsList[math.random(#WeapsList)], 99999, false, true)
end

util.create_tick_handler(function()
	return true
end)