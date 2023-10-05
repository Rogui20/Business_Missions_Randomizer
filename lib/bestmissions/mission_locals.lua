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
    LocalToEditT = {Tick = 0, MaxTick = 500, LocalAddr = SplitGlobals("Local_932.f_5"), Num = 9, ToNum = 7},
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
    }}
}

local BikerSell_DisabledVehs = {
    {Model1 = "dodo", Model2 = "raiju"},
    {Model1 = "pounder", Model2 = "vigilante"},
    {Model1 = "buzzard2", Model2 = "raiju"},
    {Model1 = "bagger", Model2 = "oppressor"},
    {Model1 = "dinghy3", Model2 = "seasparrow"}
}

BikerSellT = {
    AllowedToEdit = true,
    ScriptName = "gb_biker_contraband_sell",
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
        MaxLen = 1,
        LocalAddr = SplitGlobals("Local_11641"),
        NextOffset = 1,
        DecreaseI = 0,
        SelectedModels = Islh_Objects,
        DisabledModels = nil,
        BringTargets = nil,
        ObjectsT = {},
        SpawnObjectsT = {}
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
    AllowedToEdit = true,
    ScriptName = "business_battles",
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
    AllowedToEdit = true,
    ScriptName = "fm_content_business_battles",
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
    LocalsToEditT = {{LocalAddr = SplitGlobals("Local_5621.f_1207.f_1"), ToNum = 0}},
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
    AllowedToEdit = true,
    ScriptName = "gb_headhunter",
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
    AllowedToEdit = true,
    ScriptName = "gb_biker_rescue_contact",
    LocalsToEditT = {{LocalAddr = SplitGlobals("Local_5621.f_1207.f_1"), ToNum = 0}},
    Vehicles = {{
        MaxLen = 4,
        LocalAddr = SplitGlobals("Local_1261.f_36[iParam0]"),
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
        LocalAddr = SplitGlobals("Local_1261.f_11[bParam0]"),
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
        LocalAddr = SplitGlobals("Local_1261.f_7[iParam0]"),
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