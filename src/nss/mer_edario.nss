#include "inc_merchant"
#include "inc_loot"

void main()
{
    ApplyEWRAndInfiniteItems(OBJECT_SELF);

    CopyChest(OBJECT_SELF, "_RangeCommonT1NonUnique", 256, "", TRUE);
    CopyChest(OBJECT_SELF, "_RangeCommonT2NonUnique", 256, "", TRUE);
    CopyChest(OBJECT_SELF, "_RangeUncommonT1NonUnique", 256, "", TRUE);
    CopyChest(OBJECT_SELF, "_RangeRareT1NonUnique", 256, "", TRUE);

    CopyChest(OBJECT_SELF, "_MeleeCommonT1NonUnique", 256, "", TRUE);
    CopyChest(OBJECT_SELF, "_MeleeCommonT2NonUnique", 256, "", TRUE);
    CopyChest(OBJECT_SELF, "_MeleeCommonT3NonUnique", 256, "", TRUE);
    //CopyChest(OBJECT_SELF, "_MeleeCommonT4NonUnique", 256, "", TRUE);

    CopyChest(OBJECT_SELF, "_MeleeUncommonT1NonUnique", 256, "", TRUE);
    CopyChest(OBJECT_SELF, "_MeleeUncommonT2NonUnique", 256, "", TRUE);
    CopyChest(OBJECT_SELF, "_MeleeUncommonT3NonUnique", 256, "", TRUE);

    CopyChest(OBJECT_SELF, "_MeleeRareT1NonUnique", 256, "", TRUE);
    CopyChest(OBJECT_SELF, "_MeleeRareT2NonUnique", 256, "", TRUE);
    CopyChest(OBJECT_SELF, "_MeleeRareT3NonUnique", 256, "", TRUE);

    CopyChest(OBJECT_SELF, "_ArmorCommonT1NonUnique", 256, "", TRUE);
    CopyChest(OBJECT_SELF, "_ArmorUncommonT1NonUnique", 256, "", TRUE);
    CopyChest(OBJECT_SELF, "_ArmorRareT1NonUnique", 256, "", TRUE);
    CopyChest(OBJECT_SELF, "_ArmorCommonT2NonUnique", 256, "", TRUE);
    CopyChest(OBJECT_SELF, "_ArmorUncommonT2NonUnique", 256, "", TRUE);
    CopyChest(OBJECT_SELF, "_ArmorRareT2NonUnique", 256, "", TRUE);
    CopyChest(OBJECT_SELF, "_ArmorCommonT3NonUnique", 256, "", TRUE);
    //CopyChest(OBJECT_SELF, "_ArmorCommonT4NonUnique", 256, "", TRUE);
    CopyChest(OBJECT_SELF, "_ArmorUncommonT3NonUnique", 256, "", TRUE);
    //CopyChest(OBJECT_SELF, "_ArmorUncommonT4NonUnique", 256, "", TRUE);

    int i;
    int nMax = d2(3);
    for (i = 0; i < nMax; i++)
    {
        SelectLootItemFixedTier(OBJECT_SELF, 4, LOOT_TYPE_WEAPON_MELEE, 0);
    }

    nMax = d2(3);
    for (i = 0; i < nMax; i++)
    {
        SelectLootItemFixedTier(OBJECT_SELF, 4, LOOT_TYPE_ARMOR, 0);
    }
    
    // Does not copy t3 rare armor
    nMax = d4(3);
    for (i = 0; i < nMax; i++)
    {
        SelectLootItemFixedTier(OBJECT_SELF, 3, LOOT_TYPE_ARMOR, 0);
    }

    // Copies these chests already
    /*

    nMax = d4(3);
    for (i = 0; i < nMax; i++)
    {
        SelectLootItemFixedTier(OBJECT_SELF, 3, LOOT_TYPE_WEAPON_MELEE, 0);
    }

    nMax = d6(2);
    for (i = 0; i < nMax; i++)
    {
        SelectLootItemFixedTier(OBJECT_SELF, 2, LOOT_TYPE_ARMOR, 0);
    }

    
    nMax = d6(2);
    for (i = 0; i < nMax; i++)
    {
        SelectLootItemFixedTier(OBJECT_SELF, 2, LOOT_TYPE_WEAPON_MELEE, 0);
    }
    */

    for (i = 0; i < 5; i++)
    {
        if (Random(100) < STORE_RANDOM_T5_CHANCE)
        {
            SelectLootItemFixedTier(OBJECT_SELF, 5, LOOT_TYPE_ARMOR, 0);
        }
        if (Random(100) < STORE_RANDOM_T5_CHANCE)
        {
            SelectLootItemFixedTier(OBJECT_SELF, 5, LOOT_TYPE_WEAPON_MELEE, 0);
        }
    }
}
