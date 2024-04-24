BikerResupplyPatch = {
    Cleared = false,
    ScriptName = "gb_illicit_goods_resupply",
    Patches = {
        {
            Patched = false,
            Pattern = "28 F6 0F BD 3B 2E 03 01 28 0C 87 B3 CF",
            Offset = 1,
            PatchesToApply = {
                {
                    Offset = 8,
                    WriteInt = joaat("oppressor")
                },
                {
                    Offset = 16,
                    WriteInt = joaat("oppressor")
                },
                {
                    Offset = 32,
                    WriteInt = joaat("oppressor")
                },
                {
                    Offset = 40,
                    WriteInt = joaat("oppressor")
                },
                {
                    Offset = 48,
                    WriteInt = joaat("oppressor")
                },
                {
                    Offset = 56,
                    WriteInt = joaat("oppressor")
                },
                {
                    Offset = 64,
                    WriteInt = joaat("oppressor")
                },
                {
                    Offset = 72,
                    WriteInt = joaat("oppressor")
                },
                {
                    Offset = 96,
                    WriteInt = joaat("oppressor")
                },
                {
                    Offset = 160,
                    WriteInt = joaat("oppressor")
                }
            }
        }
    }
}