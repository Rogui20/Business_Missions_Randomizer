MissionNames = {
    "Head Hunter (CEO)", -- 166
    "Amphibious Assault (CEO)", -- 216
    "Rescue Contact (MC)", -- 183
    "Burn Assets (MC)", -- 208
    "Assault (Terrorbyte)", -- 242
    "Biker Resuply (Business)", -- 192
    "Bunker (Business)", -- 226
    "Nightclub (Business)" -- 237
}

MissionNumbers = {
    166,
    216,
    183,
    208,
    242,
    192,
    226,
    237
}

MissionArgs = {
    {StackSize = 5050, ScriptName = "GB_HEADHUNTER", Arg = 65},
    {StackSize = 5050, ScriptName = "GB_AMPHIBIOUS_ASSAULT", Arg = 77},
    {StackSize = 5050, ScriptName = "GB_BIKER_RESCUE_CONTACT", Arg = 88},
    {StackSize = 5050, ScriptName = "GB_BIKER_BURN_ASSETS", Arg = 104},
    {StackSize = 5050, ScriptName = "GB_ASSAULT", Arg = 58},
    {StackSize = 5050, ScriptName = "GB_ILLICIT_GOODS_RESUPPLY", Arg = 93},
    {StackSize = 5050, ScriptName = "GB_GUNRUNNING", Arg = 108},
    {StackSize = 5050, ScriptName = "BUSINESS_BATTLES_SELL", Arg = 115}
}

ScriptNames = {
    "Head Hunter (CEO)",
    "Amphibious Assault (CEO)",
    "Rescue Contact (MC)",
    "Burn Assets (MC)",
    "Assault",
    "Biker Resuply (Business)",
    "Bunker (Business)",
    "Nightclub (Business)",
    "Business Battles"
}

ScriptArgs = {
    {StackSize = 5050, ScriptName = "GB_HEADHUNTER", Arg = 65},
    {StackSize = 5050, ScriptName = "GB_AMPHIBIOUS_ASSAULT", Arg = 77},
    {StackSize = 5050, ScriptName = "GB_BIKER_RESCUE_CONTACT", Arg = 88},
    {StackSize = 5050, ScriptName = "GB_BIKER_BURN_ASSETS", Arg = 104},
    {StackSize = 5050, ScriptName = "GB_ASSAULT", Arg = 58},
    {StackSize = 5050, ScriptName = "GB_ILLICIT_GOODS_RESUPPLY", Arg = 93},
    {StackSize = 5050, ScriptName = "GB_GUNRUNNING", Arg = 108},
    {StackSize = 5050, ScriptName = "BUSINESS_BATTLES_SELL", Arg = 115},
    {StackSize = 15900, ScriptName = "BUSINESS_BATTLES", Arg = 114}
}

function SplitGlobals(GlobalString)
	local String = GlobalString
	local Value = String:gsub("%[(.-)]", "+1")
	local NewValue = Value:gsub("%a", "")
	local NewValue2 = NewValue:gsub("._", "+")
	local NewValue3 = NewValue2:gsub("_", "")
	local _Text, SymbolCount = NewValue3:gsub("+", "")
	local PatternCount = "(%d+)"
	for i = 1, SymbolCount do
		PatternCount = PatternCount .. "+(%d+)"
	end
	local Global, Global2, Global3, Global4, Global5, Global6, Global7 = NewValue3:match(PatternCount)
	local GlobalNumber = 0
	if Global ~= nil then
		GlobalNumber = GlobalNumber + tonumber(Global)
	end
	if Global2 ~= nil then
		GlobalNumber = GlobalNumber + tonumber(Global2)
	end
	if Global3 ~= nil then
		GlobalNumber = GlobalNumber + tonumber(Global3)
	end
	if Global4 ~= nil then
		GlobalNumber = GlobalNumber + tonumber(Global4)
	end
	if Global5 ~= nil then
		GlobalNumber = GlobalNumber + tonumber(Global5)
	end
	if Global6 ~= nil then
		GlobalNumber = GlobalNumber + tonumber(Global6)
	end
	if Global7 ~= nil then
		GlobalNumber = GlobalNumber + tonumber(Global7)
	end
	return GlobalNumber
end

MissionGlobals = {
    WhichMissionStart = SplitGlobals("Global_1895156[bParam0 /*609*/].f_10.f_32"),
    WhichMissionIn = SplitGlobals("Global_1895156[bParam0 /*609*/].f_10.f_33"),
    InWhichPlayerIndex = SplitGlobals("Global_1895156[bParam0 /*609*/].f_10.f_35"),
    NextPlayer = 609
}

AppGlobals = {
    PropertyNumber = SplitGlobals("Global_2657704[iParam0 /*463*/].f_321.f_7"),
    NextPlayer = 463,
    WarehouseOrOffice = SplitGlobals("Global_1969858.f_1"),
    PropertyID = SplitGlobals("Global_1853988[PLAYER::PLAYER_ID() /*867*/].f_267.f_33"),
    NextPlayerPropertyID = 867
}
