//::///////////////////////////////////////////////
//:: Deadly Frost Trap
//:: X2_T1_ColdEpicC
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Strikes the entering object with a blast of
    cold for 40d4 damage. Fortitude save to avoid
    being paralyzed for 4 rounds.
*/
//:://////////////////////////////////////////////
//:: Created By: Andrew Nobbs
//:: Created On: June 09, 2003
//:://////////////////////////////////////////////

#include "nw_i0_spells"
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
    effect eDam = EffectDamage(d4(40), DAMAGE_TYPE_COLD);
    effect eParal = EffectParalyze();
    effect eVis = EffectVisualEffect(VFX_IMP_FROST_S, FALSE, TRAP_VFX_SIZE_EPIC);
    effect eFreeze = EffectVisualEffect(VFX_DUR_BLUR);
    effect eLink = EffectLinkEffects(eParal, eFreeze);
    if(!MySavingThrow(SAVING_THROW_FORT,oTarget, 30, SAVING_THROW_TYPE_COLD))
    {
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(4));
    }
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
    SetTrapTriggeredOnCreature(oTarget, "epic frost trap");
}
