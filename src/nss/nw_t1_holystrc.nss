//::///////////////////////////////////////////////
//:: Strong Holy Trap
//:: NW_T1_HolyStrC
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Strikes the entering undead with a dose of holy
    water for 8d10 damage.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: July 4th, 2001
//:://////////////////////////////////////////////

#include "70_inc_spells"
#include "inc_trap"

void main()
{
    //1.72: fix for bug where traps are being triggered where they really aren't
    if(GetObjectType(OBJECT_SELF) == OBJECT_TYPE_TRIGGER && !GetIsInSubArea(GetEnteringObject()))
    {
        return;
    }
    //Declare major variables
    object oTarget = GetEnteringObject();
    int nAC = GetAC(oTarget);
    //Make attack roll
    int nRoll = d20() + 10 + 6;
    effect eDam = EffectDamage(d10(8), DAMAGE_TYPE_DIVINE);
    effect eVis = EffectVisualEffect(VFX_IMP_SUNSTRIKE, FALSE, TRAP_VFX_SIZE_STRONG);
    if (nRoll > 0)
    {
        if (spellsIsRacialType(oTarget, RACIAL_TYPE_UNDEAD))
        {
            //Apply Holy Damage
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
        }
        else
        {
            eDam = EffectDamage(d4(6), DAMAGE_TYPE_DIVINE);
            //Apply Holy Damage
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
            SetTrapTriggeredOnCreature(oTarget, "strong holy trap");
        }
    }
}

