local SupplyVehsList = {
    "scramjet",
    "toreador",
    "vigilante",
    "oppressor"
}

local Global_Objects = {
    "ex_prop_crate_ammo_bc",
    "ex_prop_crate_ammo_sc",
    "vw_prop_casino_art_grenade_01c",
    "sf_prop_sf_art_coin_01a",
    "ex_prop_adv_case_sm_02",
    "ex_prop_crate_elec_sc",
    "ex_prop_crate_elec_bc",
    "ex_prop_crate_minig",
    "ex_prop_crate_tob_sc",
    "ex_prop_crate_shide",
    "stt_prop_stunt_soccer_sball",
    "vw_prop_casino_art_car_03a",
    "sf_prop_sf_art_statue_tgr_01a",
    "p_rcss_folded",
    "p_gcase_s",
    "bkr_prop_bkr_cashpile_04",
    "bkr_prop_coke_powderedmilk",
    "bkr_prop_biker_gcase_s",
    "ex_office_swag_booze_cigs",
    "ex_office_swag_electronic3",
    "ex_office_swag_electronic",
    "ex_office_swag_med2",
    "ex_prop_ex_laptop_01a",
    "ex_office_swag_silver2",
    "ex_office_swag_silver3",
    "prop_large_gold",
    "vw_prop_casino_art_miniature_05a",
    "vw_prop_casino_art_grenade_01a"
}

local Biker_DisabledVehs = {
    {Model1 = "stockade", Model2 = "stockade"}
}

local Biker_Objects = {
    "ex_prop_crate_ammo_bc",
    "ex_prop_crate_ammo_sc",
    "vw_prop_casino_art_grenade_01c",
    "sf_prop_sf_art_coin_01a",
    "ex_prop_adv_case_sm_02",
    "ex_prop_crate_elec_sc",
    "ex_prop_crate_elec_bc",
    "ex_prop_crate_minig",
    "ex_prop_crate_tob_sc",
    "ex_prop_crate_shide"
}

BikerResupplyT = {
    AllowedToEdit = true,
    ScriptName = "gb_illicit_goods_resupply",
    ClearedBlips = false,
    LocalsToEditT = {{Tick = 0, MaxTick = 500, LocalAddr = SplitGlobals("Local_932.f_5"), Num = 9, ToNum = 7},
    {Tick = 0, MaxTick = 500, LocalAddr = SplitGlobals("Local_932.f_5"), Num = 14, ToNum = 9}},
    Vehicles = {{
        MaxLen = 8,
        LocalAddr = SplitGlobals("Local_932.f_33"),
        NextOffset = 1,
        DecreaseI = 0,
        SelectedModels = SupplyVehsList,
        DisabledModels = Biker_DisabledVehs,
        UpgradeType = 1,
        BringTargets = 200.0,
        HealthToGive = 50000,
        VehiclesT = {},
        IsSupply = true
    },
    {
        MaxLen = 10,
        LocalAddr = SplitGlobals("Local_932.f_404[0 /*5*/]"),
        NextOffset = 5,
        DecreaseI = 1,
        SelectedModels = VehsList,
        DisabledModels = Biker_DisabledVehs,
        UpgradeType = 0,
        BringTargets = 200.0,
        HealthToGive = nil,
        VehiclesT = {}
    }},
    Peds = {{
        MaxLen = 22,
        LocalAddr = SplitGlobals("Local_932.f_73[bVar0 /*15*/]"),
        NextOffset = 15,
        DecreaseI = 1,
        SelectedModels = Peds_Models_List,
        DisabledModels = nil,
        PedSetts = 2,
        BringTargets = 200.0,
        PedsT = {}
    }},
    Objects = {{
        MaxLen = 8,
        LocalAddr = SplitGlobals("Local_932.f_33"),
        NextOffset = 1,
        DecreaseI = 0,
        SelectedModels = Global_Objects,
        DisabledModels = nil,
        BringTargets = nil,
        ObjectsT = {},
        SpawnObjectsT = {},
        IsSupply = true
    }},
    PropsToBring = {{
        MaxLen = 40,
        LocalAddr = SplitGlobals("Local_932.f_635"),
        NextOffset = 1,
        DecreaseI = 0,
        SelectedModels = nil,
        DisabledModels = nil,
        BringTargets = nil,
        PropsT = {}
    }}
}

local BikerSell_DisabledVehs = {
    {Model1 = "dodo", Model2 = "raiju"},
    {Model1 = "pounder", Model2 = "vigilante"},
    {Model1 = "buzzard2", Model2 = "raiju"},
    {Model1 = "bagger", Model2 = "oppressor"},
    {Model1 = "dinghy3", Model2 = "seasparrow"},
    {Model1 = "trash", Model2 = "toreador"},
    {Model1 = "trash2", Model2 = "toreador"},
    --{Model1 = "oppressor", Model2 = "toreador"}
}

BikerSellT = {
    AllowedToEdit = true,
    ScriptName = "gb_biker_contraband_sell",
    ClearedBlips = false,
    BestSellMission = {LocalAddr = SplitGlobals("Local_699.f_17"), ToNum = 0},
    Vehicles = {{
        MaxLen = 4,
        LocalAddr = SplitGlobals("Local_699.f_59"),
        NextOffset = 1,
        DecreaseI = 0,
        SelectedModels = SupplyVehsList,
        DisabledModels = BikerSell_DisabledVehs,
        UpgradeType = 1,
        BringTargets = 200.0,
        HealthToGive = 50000,
        VehiclesT = {},
        IsSupply = true
    }},
    Peds = {{
        MaxLen = 0
    }},
    Objects = {{
        MaxLen = 0
    }}
}

local CH_DisabledVehs = {
    {Model1 = "stockade", Model2 = "stockade"},
    {Model1 = "riot", Model2 = "riot"},
    {Model1 = "cargobob2", Model2 = "cargobob2"}
}

CasinoHeistT = {
    AllowedToEdit = true,
    ScriptName = "gb_casino_heist",
    ClearedBlips = false,
    Vehicles = {{
        MaxLen = 8,
        LocalAddr = SplitGlobals("Local_4275"),
        NextOffset = 1,
        DecreaseI = 0,
        SelectedModels = SupplyVehsList,
        DisabledModels = CH_DisabledVehs,
        UpgradeType = 1,
        BringTargets = 200.0,
        HealthToGive = 50000,
        VehiclesT = {}
    },
    {
        MaxLen = 30,
        LocalAddr = SplitGlobals("Local_4275.f_947[iVar1 /*8*/]"),
        NextOffset = 8,
        DecreaseI = 1,
        SelectedModels = VehsList,
        DisabledModels = CH_DisabledVehs,
        UpgradeType = 0,
        BringTargets = 200.0,
        HealthToGive = nil,
        VehiclesT = {}
    }},
    Peds = {{
        MaxLen = 35,
        LocalAddr = SplitGlobals("Local_4275.f_106[bVar1 /*24*/]"),
        NextOffset = 24,
        DecreaseI = 1,
        SelectedModels = Peds_Models_List,
        DisabledModels = nil,
        PedSetts = 2,
        BringTargets = 200.0,
        PedsT = {}
    }},
    Objects = {{
        MaxLen = 8,
        LocalAddr = SplitGlobals("Local_4275"),
        NextOffset = 1,
        DecreaseI = 0,
        SelectedModels = Global_Objects,
        DisabledModels = nil,
        BringTargets = nil,
        ObjectsT = {},
        SpawnObjectsT = {}
    }},
    PropsToBring = {{
        MaxLen = 25,
        LocalAddr = SplitGlobals("Local_4275.f_1188[bVar0 /*4*/]"),
        NextOffset = 4,
        DecreaseI = 1,
        SelectedModels = nil,
        DisabledModels = nil,
        BringTargets = nil,
        PropsT = {}
    }}
}

local Islh_Objects = {
    "sf_prop_sf_art_statue_tgr_01a",
    "sf_prop_sf_art_coin_01a"
}

local IslH_DisabledVehs = {
    {Model1 = "velum2", Model2 = "streamer216"},
    {Model1 = "longfin", Model2 = "seasparrow"},
    {Model1 = "valkyrie", Model2 = "avenger", Upgrade = 0},
    {Model1 = "valkyrie2", Model2 = "avenger", Upgrade = 0}
}

CayoPericoHeistT = {
    AllowedToEdit = true,
    ScriptName = "fm_content_island_heist",
    ClearedBlips = false,
    Vehicles = {{
        MaxLen = 25,
        LocalAddr = SplitGlobals("Local_13062.f_863[iVar0 /*8*/]"),
        NextOffset = 8,
        DecreaseI = 1,
        SelectedModels = VehsList,
        DisabledModels = IslH_DisabledVehs,
        UpgradeType = 0,
        BringTargets = 200.0,
        HealthToGive = 50000,
        VehiclesT = {}
    }},
    Peds = {{
        MaxLen = 30,
        LocalAddr = SplitGlobals("Local_13062.f_112[iVar0 /*25*/]"),
        NextOffset = 25,
        DecreaseI = 1,
        SelectedModels = Peds_Models_List,
        DisabledModels = nil,
        PedSetts = 2,
        BringTargets = 200.0,
        PedsT = {}
    }},
    Objects = {{
        MaxLen = 10,
        LocalAddr = SplitGlobals("Local_13062.f_2"),
        NextOffset = 1,
        DecreaseI = 0,
        SelectedModels = Global_Objects,
        DisabledModels = nil,
        BringTargets = nil,
        ObjectsT = {},
        SpawnObjectsT = {}
    }},
    PropsToBring = {{
        MaxLen = 31,
        LocalAddr = SplitGlobals("Local_13062.f_1064[iParam0 /*5*/]"),
        NextOffset = 5,
        DecreaseI = 1,
        SelectedModels = nil,
        DisabledModels = nil,
        BringTargets = nil,
        PropsT = {}
    }}
}

local CBuy_Objects = {
    "stt_prop_stunt_soccer_sball",
    "vw_prop_casino_art_car_03a",
    "sf_prop_sf_art_coin_01a"
}

local ContrabandBuy_DisabledVehs = {
    {Model1 = "marquis", Model2 = "marquis"},
    {Model1 = "valkyrie", Model2 = "valkyrie"},
    {Model1 = "valkyrie2", Model2 = "valkyrie2"},
    {Model1 = "frogger", Model2 = "frogger"}
}

ContrabandBuyT = {
    AllowedToEdit = true,
    ScriptName = "gb_contraband_buy",
    Vehicles = {{
        MaxLen = 3,
        LocalAddr = SplitGlobals("Local_599.f_14"),
        NextOffset = 1,
        DecreaseI = 0,
        SelectedModels = SupplyVehsList,
        DisabledModels = ContrabandBuy_DisabledVehs,
        UpgradeType = 0,
        BringTargets = 200.0,
        HealthToGive = 50000,
        VehiclesT = {}
    },
    {
        MaxLen = 6,
        LocalAddr = SplitGlobals("Local_599.f_159"),
        NextOffset = 1,
        DecreaseI = 0,
        SelectedModels = VehsList,
        DisabledModels = ContrabandBuy_DisabledVehs,
        UpgradeType = 0,
        BringTargets = 200.0,
        HealthToGive = 50000,
        VehiclesT = {}
    }},
    Peds = {{
        MaxLen = 15,
        LocalAddr = SplitGlobals("Local_599.f_23[*9*]"),
        NextOffset = 9,
        DecreaseI = 1,
        SelectedModels = Peds_Models_List,
        DisabledModels = nil,
        PedSetts = 2,
        BringTargets = 200.0,
        PedsT = {}
    }},
    Objects = {{
        MaxLen = 3,
        LocalAddr = SplitGlobals("Local_599.f_14"),
        NextOffset = 1,
        DecreaseI = 0,
        SelectedModels = Global_Objects,
        DisabledModels = nil,
        BringTargets = nil,
        ObjectsT = {},
        SpawnObjectsT = {}
    }}
}

local ContrabandSell_DisabledVehs = {
    {Model1 = "tug", Model2 = "seasparrow"},
    {Model1 = "titan", Model2 = "raiju"},
    {Model1 = "brickade", Model2 = "scramjet"}
}

ContrabandSellT = {
    AllowedToEdit = true,
    ScriptName = "gb_contraband_sell",
    ClearedBlips = false,
    Vehicles = {{
        MaxLen = 3,
        LocalAddr = SplitGlobals("Local_541.f_35"),
        NextOffset = 1,
        DecreaseI = 0,
        SelectedModels = SupplyVehsList,
        DisabledModels = ContrabandSell_DisabledVehs,
        UpgradeType = 0,
        BringTargets = 200.0,
        HealthToGive = 50000,
        VehiclesT = {},
        IsSupply = true
    }},
    Peds = {{
        MaxLen = 0
    }},
    Objects = {{
        MaxLen = 0
    }}
}

local BunkerSell_DisabledVehs = {
    {Model1 = "phantom2", Model2 = "phantom2"}
}

local Bunker_Objects = {
    "vw_prop_casino_art_car_09a",
    "vw_prop_casino_art_car_03a",
    "vw_prop_casino_art_grenade_01c",
    "sf_prop_sf_art_coin_01a"
}

GunrunningT = {
    AllowedToEdit = true,
    ScriptName = "gb_gunrunning",
    ClearedBlips = false,
    Vehicles = {{
        MaxLen = 8,
        LocalAddr = SplitGlobals("Local_1206.f_4"),
        NextOffset = 1,
        DecreaseI = 0,
        SelectedModels = SupplyVehsList,
        DisabledModels = BunkerSell_DisabledVehs,
        UpgradeType = 0,
        BringTargets = 200.0,
        HealthToGive = 50000,
        VehiclesT = {},
        IsSupply = true
    },
    {
        MaxLen = 16,
        LocalAddr = SplitGlobals("Local_1206.f_470[*5*]"),
        NextOffset = 5,
        DecreaseI = 1,
        SelectedModels = VehsList,
        DisabledModels = BunkerSell_DisabledVehs,
        UpgradeType = 0,
        BringTargets = 200.0,
        HealthToGive = 50000,
        VehiclesT = {}
    }},
    Peds = {{
        MaxLen = 29,
        LocalAddr = SplitGlobals("Local_1206.f_92[*13*]"),
        NextOffset = 13,
        DecreaseI = 1,
        SelectedModels = Peds_Models_List,
        DisabledModels = nil,
        PedSetts = 2,
        BringTargets = 200.0,
        PedsT = {}
    }},
    Objects = {{
        MaxLen = 8,
        LocalAddr = SplitGlobals("Local_1206.f_4"),
        NextOffset = 1,
        DecreaseI = 0,
        SelectedModels = Global_Objects,
        DisabledModels = nil,
        BringTargets = nil,
        ObjectsT = {},
        SpawnObjectsT = {},
        IsSupply = true
    }}
}

local BusinessBattles_DisabledVehs = {
    {Model1 = "stockade", Model2 = "stockade"}
}

local BusinessBattles_Objects = {
    "ex_prop_crate_ammo_bc",
    "ex_prop_crate_ammo_sc",
    "vw_prop_casino_art_grenade_01c",
    "sf_prop_sf_art_coin_01a",
    "ex_prop_adv_case_sm_02",
    "ex_prop_crate_elec_sc",
    "ex_prop_crate_elec_bc",
    "ex_prop_crate_minig",
    "ex_prop_crate_tob_sc",
    "ex_prop_crate_shide"
}

BusinessBattlesT = {
    AllowedToEdit = false,
    ScriptName = "business_battles",
    ClearedBlips = false,
    Vehicles = {{
        MaxLen = 8,
        LocalAddr = SplitGlobals("Local_2399"),
        NextOffset = 1,
        DecreaseI = 0,
        SelectedModels = SupplyVehsList,
        DisabledModels = nil,
        UpgradeType = 1,
        BringTargets = 200.0,
        HealthToGive = 50000,
        VehiclesT = {}
    },
    {
        MaxLen = 30,
        LocalAddr = SplitGlobals("Local_2399.f_624[*7*]"),
        NextOffset = 7,
        DecreaseI = 1,
        SelectedModels = VehsList,
        DisabledModels = nil,
        UpgradeType = 0,
        BringTargets = 200.0,
        HealthToGive = nil,
        VehiclesT = {}
    }},
    Peds = {{
        MaxLen = 35,
        LocalAddr = SplitGlobals("Local_2399.f_98[*15*]"),
        NextOffset = 15,
        DecreaseI = 1,
        SelectedModels = Peds_Models_List,
        DisabledModels = nil,
        PedSetts = 2,
        BringTargets = 200.0,
        PedsT = {}
    }},
    Objects = {{
        MaxLen = 8,
        LocalAddr = SplitGlobals("uLocal_2399.f_1110"),
        NextOffset = 1,
        DecreaseI = 0,
        SelectedModels = Global_Objects,
        DisabledModels = nil,
        BringTargets = nil,
        ObjectsT = {},
        SpawnObjectsT = {}
    }}
}

local BusinessBattles2_DisabledVehs = {
    {Model1 = "stockade", Model2 = "stockade"}
}

local BusinessBattles2_Objects = {
    "ex_prop_crate_ammo_bc",
    "ex_prop_crate_ammo_sc",
    "vw_prop_casino_art_grenade_01c",
    "sf_prop_sf_art_coin_01a",
    "ex_prop_adv_case_sm_02",
    "ex_prop_crate_elec_sc",
    "ex_prop_crate_elec_bc",
    "ex_prop_crate_minig",
    "ex_prop_crate_tob_sc",
    "ex_prop_crate_shide"
}

BusinessBattles2T = {
    AllowedToEdit = false,
    ScriptName = "fm_content_business_battles",
    ClearedBlips = false,
    Vehicles = {{
        MaxLen = 10,
        LocalAddr = SplitGlobals("Local_5090.f_843[*8*]"),
        NextOffset = 8,
        DecreaseI = 1,
        SelectedModels = VehsList,
        DisabledModels = nil,
        UpgradeType = 1,
        BringTargets = 200.0,
        HealthToGive = 50000,
        VehiclesT = {}
    }},
    Peds = {{
        MaxLen = 35,
        LocalAddr = SplitGlobals("Local_5090.f_92[*25*]"),
        NextOffset = 25,
        DecreaseI = 1,
        SelectedModels = Peds_Models_List,
        DisabledModels = nil,
        PedSetts = 2,
        BringTargets = 200.0,
        PedsT = {}
    }},
    Objects = {{
        MaxLen = 8,
        LocalAddr = SplitGlobals("Local_5090.f_2"),
        NextOffset = 1,
        DecreaseI = 0,
        SelectedModels = Global_Objects,
        DisabledModels = nil,
        BringTargets = nil,
        ObjectsT = {},
        SpawnObjectsT = {}
    }}
}

ContrabandBuy2T = {
    AllowedToEdit = true,
    ScriptName = "fm_content_cargo",
    ClearedBlips = false,
    LocalsToEditT = {{Tick = 0, MaxTick = 0, LocalAddr = SplitGlobals("Local_5621.f_1207.f_1"), ToNum = 0}},
    Vehicles = {{
        MaxLen = 23,
        LocalAddr = SplitGlobals("Local_5621.f_723[iParam0 /*8*/]"),
        NextOffset = 8,
        DecreaseI = 1,
        SelectedModels = VehsList,
        DisabledModels = nil,
        UpgradeType = 0,
        BringTargets = 200.0,
        HealthToGive = 50000,
        VehiclesT = {}
    }},
    Peds = {{
        MaxLen = 26,
        LocalAddr = SplitGlobals("Local_5621.f_72[iParam0 /*25*/]"),
        NextOffset = 25,
        DecreaseI = 1,
        SelectedModels = Peds_Models_List,
        DisabledModels = nil,
        PedSetts = 2,
        BringTargets = 200.0,
        PedsT = {}
    }},
    Objects = {{
        MaxLen = 0
    }}
}

HeadhunterT = {
    AllowedToEdit = false,
    ScriptName = "gb_headhunter",
    ClearedBlips = false,
    Vehicles = {{
        MaxLen = 4,
        LocalAddr = SplitGlobals("Local_94.f_2[bVar0 /*26*/].f_2"),
        NextOffset = 26,
        DecreaseI = 1,
        SelectedModels = VehsList,
        DisabledModels = nil,
        UpgradeType = 0,
        BringTargets = 200.0,
        HealthToGive = 500,
        VehiclesT = {}
    }},
    Peds = {{
        MaxLen = 4,
        LocalAddr = SplitGlobals("Local_94.f_2[bVar0 /*26*/].f_1"),
        NextOffset = 26,
        DecreaseI = 1,
        SelectedModels = Peds_Models_List,
        DisabledModels = nil,
        PedSetts = 2,
        BringTargets = 200.0,
        PedsT = {}
    },
    {
        MaxLen = 4,
        LocalAddr = SplitGlobals("Local_94.f_2[iParam0 /*26*/].f_7[bVar1]"),
        NextOffset = 26,
        DecreaseI = 1,
        SelectedModels = Peds_Models_List,
        DisabledModels = nil,
        PedSetts = 2,
        BringTargets = 200.0,
        PedsT = {}
    },
    {
        MaxLen = 4,
        LocalAddr = SplitGlobals("Local_94.f_2[iParam0 /*26*/].f_3[iVar1].f_1"),
        NextOffset = 26,
        DecreaseI = 1,
        SelectedModels = Peds_Models_List,
        DisabledModels = nil,
        PedSetts = 2,
        BringTargets = 200.0,
        PedsT = {}
    },
    {
        MaxLen = 4,
        LocalAddr = SplitGlobals("Local_94.f_2[iParam0 /*26*/].f_3[iVar1].f_2"),
        NextOffset = 26,
        DecreaseI = 1,
        SelectedModels = Peds_Models_List,
        DisabledModels = nil,
        PedSetts = 2,
        BringTargets = 200.0,
        PedsT = {}
    }},
    Objects = {{
        MaxLen = 0
    }}
}

BikerRescueContactT = {
    AllowedToEdit = false,
    ScriptName = "gb_biker_rescue_contact",
    ClearedBlips = false,
    LocalsToEditT = {{Tick = 0, MaxTick = 0,LocalAddr = SplitGlobals("Local_5621.f_1207.f_1"), ToNum = 0}},
    Vehicles = {{
        MaxLen = 4,
        LocalAddr = SplitGlobals("Local_1261.f_36"),
        NextOffset = 1,
        DecreaseI = 0,
        SelectedModels = VehsList,
        DisabledModels = nil,
        UpgradeType = 0,
        BringTargets = 200.0,
        HealthToGive = 50000,
        VehiclesT = {}
    }},
    Peds = {{
        MaxLen = 20,
        LocalAddr = SplitGlobals("Local_1261.f_11"),
        NextOffset = 1,
        DecreaseI = 0,
        SelectedModels = Peds_Models_List,
        DisabledModels = nil,
        PedSetts = 2,
        BringTargets = 200.0,
        PedsT = {}
    },
    {
        MaxLen = 3,
        LocalAddr = SplitGlobals("Local_1261.f_7"),
        NextOffset = 1,
        DecreaseI = 0,
        SelectedModels = Peds_Models_List,
        DisabledModels = nil,
        PedSetts = 4,
        BringTargets = 200.0,
        PedsT = {}
    }},
    Objects = {{
        MaxLen = 0
    }}
}

local MissionController_DisabledVehs = {
    {Model1 = "coquette2", Model2 = "sultan3", Upgrade = 2},
    {Model1 = "coquette3", Model2 = "sultan3", Upgrade = 2},
    {Model1 = "asea", Model2 = "sultan3", Upgrade = 2},
    {Model1 = "velum2", Model2 = "shamal", Upgrade = 2},
    {Model1 = "granger", Model2 = "kamacho", Upgrade = 2},
    {Model1 = "kuruma2", Model2 = "toreador", Upgrade = 2},
    {Model1 = "kuruma", Model2 = "toreador", Upgrade = 2},
    {Model1 = "hydra", Model2 = "raiju", Upgrade = 2},
    {Model1 = "pbus", Model2 = "bus", Upgrade = 1},
    {Model1 = "boxville", Model2 = "boxville", Upgrade = 2},
    {Model1 = "boxville2", Model2 = "boxville2", Upgrade = 2},
    {Model1 = "boxville3", Model2 = "boxville3", Upgrade = 2},
    {Model1 = "boxville4", Model2 = "boxville4", Upgrade = 2},
    {Model1 = "dinghy", Model2 = "patrolboat", Upgrade = 2},
    {Model1 = "dinghy2", Model2 = "patrolboat", Upgrade = 2},
    {Model1 = "dinghy3", Model2 = "patrolboat", Upgrade = 2},
    {Model1 = "dinghy4", Model2 = "patrolboat", Upgrade = 2},
    {Model1 = "lectro", Model2 = "oppressor", Upgrade = 2},
    {Model1 = "barracks", Model2 = "barrage", Upgrade = 2},
    {Model1 = "barracks3", Model2 = "barrage", Upgrade = 2},
    {Model1 = "insurgent", Model2 = "tampa3", Upgrade = 2},
    {Model1 = "insurgent2", Model2 = "tampa3", Upgrade = 2},
    {Model1 = "predator", Model2 = "dinghy5", Upgrade = 2},
    {Model1 = "buzzard", Model2 = "valkyrie", Upgrade = 2},
    {Model1 = "valkyrie", Model2 = "savage", Upgrade = 2},
    {Model1 = "cargobob", Model2 = "cargobob", Upgrade = 2},
    {Model1 = "cargobob2", Model2 = "cargobob2", Upgrade = 2},
    {Model1 = "technical", Model2 = "tampa3", Upgrade = 2},
    {Model1 = "mule", Model2 = "tampa3", Upgrade = 2},
    {Model1 = "mule2", Model2 = "tampa3", Upgrade = 2},
    {Model1 = "mule3", Model2 = "tampa3", Upgrade = 2},
    {Model1 = "mule4", Model2 = "tampa3", Upgrade = 2},
    {Model1 = "frogger", Model2 = "valkyrie", Upgrade = 2},
    {Model1 = "frogger2", Model2 = "valkyrie", Upgrade = 2},
    {Model1 = "trash", Model2 = "trash", Upgrade = 2},
    {Model1 = "trash2", Model2 = "trash2", Upgrade = 2},
    {Model1 = "phantom", Model2 = "phantom2", Upgrade = 2},
    {Model1 = "seashark", Model2 = "patrolboat", Upgrade = 2},
    {Model1 = "seashark2", Model2 = "patrolboat", Upgrade = 2},
    {Model1 = "seashark3", Model2 = "patrolboat", Upgrade = 2},
}

MissionController_ClassicHeistsT = {
    AllowedToEdit = false,
    ScriptName = "fm_mission_controller",
    ClearedBlips = false,
    Vehicles = {{
        MaxLen = 0,
        LocalAddr = SplitGlobals("Local_22924.f_834.f_81"),
        NextOffset = 1,
        DecreaseI = 0,
        SelectedModels = nil,
        DisabledModels = MissionController_DisabledVehs,
        UpgradeType = 0,
        BringTargets = 200.0,
        HealthToGive = 50000,
        VehiclesT = {}
    }},
    Peds = {{
        MaxLen = 0,
        LocalAddr = SplitGlobals("Local_1261.f_11"),
        NextOffset = 1,
        DecreaseI = 0,
        SelectedModels = Peds_Models_List,
        DisabledModels = nil,
        PedSetts = 2,
        BringTargets = 200.0,
        PedsT = {}
    }},
    Objects = {{
        MaxLen = 0
    }},
    VehiclesGlobals = {{
        MaxLen = 32,
        GlobalAddr = SplitGlobals("Global_4980736.f_91874[bVar0 /*529*/].f_12"),
        NextOffset = 529,
        DecreaseI = 1,
        SelectedModels = nil,
        DisabledModels = MissionController_DisabledVehs,
        UpgradeGlobal = SplitGlobals("Global_4980736.f_91874[bVar0 /*529*/].f_111"),
        VehiclesT = {}
    }}
}