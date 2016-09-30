
#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "karazhan.h"

#define SAY_AGGRO               -1532018
#define SAY_SLAY1               -1532019
#define SAY_SLAY2               -1532020
#define SAY_SLAY3               -1532021
#define SAY_REPENTANCE1         -1532022
#define SAY_REPENTANCE2         -1532023
#define SAY_DEATH               -1532024

#define SPELL_REPENTANCE        29511
#define SPELL_HOLYFIRE          29522
#define SPELL_HOLYWRATH         32445
#define SPELL_HOLYGROUND        29512
#define SPELL_BERSERK           26662

struct boss_maiden_of_virtueAI : public ScriptedAI
{
    boss_maiden_of_virtueAI(Creature* c) : ScriptedAI(c)
	{
		pInstance = (ScriptedInstance*)c->GetInstanceData();

		if (pInstance)
			pInstance->SetData(TYPE_MAIDEN, NOT_STARTED);
	}

	ScriptedInstance *pInstance;
    uint32 Repentance_Timer;
    uint32 Holyfire_Timer;
    uint32 Holywrath_Timer;
    uint32 Holyground_Timer;
    uint32 Enrage_Timer;
	uint32 CheckTimer;

    bool Enraged;

    void Reset()
    {
        Repentance_Timer    = 30000 + (rand() % 15000);
		Holyfire_Timer = 6000 + (rand() % 10000);
		Holywrath_Timer = 20000;
		Holyground_Timer = 2000;
		Enrage_Timer = 600000;
		CheckTimer = 1000;

		me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_AURA_PERIODIC_MANA_LEECH, true);

		if (pInstance && pInstance->GetData(TYPE_MAIDEN) != DONE)
			pInstance->SetData(TYPE_MAIDEN, NOT_STARTED);

		Enraged = false;
    }

	void SpellHit(Unit* caster, const SpellEntry *Spell)
	{
		if (Spell->Id == 1714)
		{
			me->RemoveAurasDueToSpell(1714);
			caster->SendSpellMiss(me, 1714, SPELL_MISS_IMMUNE);
		}
		if (Spell->Id == 11719)
		{
			me->RemoveAurasDueToSpell(11719);
			caster->SendSpellMiss(me, 11719, SPELL_MISS_IMMUNE);
		}
	}

    void KilledUnit(Unit* /*Victim*/)
    {
            DoScriptText(RAND(SAY_SLAY1, SAY_SLAY2, SAY_SLAY3), me);
    }

    void JustDied(Unit* /*Killer*/)
    {
        DoScriptText(SAY_DEATH, me);
		if (pInstance)
			pInstance->SetData(TYPE_MAIDEN, DONE);
    }

    void EnterCombat(Unit* /*who*/)
    {
        DoScriptText(SAY_AGGRO, me);
		if (pInstance)
			pInstance->SetData(TYPE_MAIDEN, IN_PROGRESS);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!UpdateVictim())
            return;

		if (CheckTimer < diff)
		{
			DoZoneInCombat();
			CheckTimer = 1000;
		}
		else
			CheckTimer -= diff;

        if (Enrage_Timer <= diff && !Enraged)
        {
            DoCast(me, SPELL_BERSERK, true);
            Enraged = true;
        }
        else Enrage_Timer -= diff;





        if (Holyground_Timer <= diff)
        {
            DoCast(me, SPELL_HOLYGROUND, true);   //Triggered so it doesn't interrupt her at all
			Holyground_Timer = 1500;
        }
        else Holyground_Timer -= diff;


        if (Repentance_Timer <= diff)
        {
			if (!me->HasUnitState(UNIT_STATE_CASTING))
			{
				DoCastVictim(SPELL_REPENTANCE);
				DoScriptText(RAND(SAY_REPENTANCE1, SAY_REPENTANCE2), me);
				Repentance_Timer = 30000 + (rand() % 15000);
			}
        }
        else Repentance_Timer -= diff;

        if (Holyfire_Timer <= diff)
        {
			Unit* pTarget = NULL;
			ThreatContainer::StorageType const &t_list = me->getThreatManager().getThreatList();
			std::vector<Unit* > target_list;
			for (ThreatContainer::StorageType::const_iterator itr = t_list.begin(); itr != t_list.end(); ++itr)
			{
				pTarget = Unit::GetUnit(*me, (*itr)->getUnitGuid());
				if (pTarget && !pTarget->IsWithinDist(me, 5.0f, false) && pTarget->IsWithinDist(me, GetSpellMaxRange(SPELL_HOLYFIRE), false) && (pTarget->GetTypeId() == TYPEID_PLAYER))
					target_list.push_back(pTarget);
				pTarget = NULL;
			}
			if (target_list.size())
				pTarget = *(target_list.begin() + rand() % target_list.size());

			if (pTarget)
			{
				if (!me->HasUnitState(UNIT_STATE_CASTING))
				{
					DoCast(pTarget, SPELL_HOLYFIRE);
					Holyfire_Timer = 6000 + rand() % 10000;
				}
			}
        }
        else Holyfire_Timer -= diff;

        if (Holywrath_Timer <= diff)
        {
			Unit* pTarget = NULL;
			ThreatContainer::StorageType const &t_list = me->getThreatManager().getThreatList();
			std::vector<Unit* > target_list;
			for (ThreatContainer::StorageType::const_iterator itr = t_list.begin(); itr != t_list.end(); ++itr)
			{
				pTarget = Unit::GetUnit(*me, (*itr)->getUnitGuid());
				if (pTarget && pTarget->IsWithinDist(me, GetSpellMaxRange(SPELL_HOLYWRATH), false) && (pTarget->GetTypeId() == TYPEID_PLAYER))
					target_list.push_back(pTarget);
				pTarget = NULL;
			}
			if (target_list.size())
				pTarget = *(target_list.begin() + rand() % target_list.size());

			if (pTarget)
			{
				if (!me->HasUnitState(UNIT_STATE_CASTING))
				{
					DoCast(pTarget, SPELL_HOLYWRATH);
					Holywrath_Timer = 20000;
				}
			}

        }
        else Holywrath_Timer -= diff;

        DoMeleeAttackIfReady();
    }

};

CreatureAI* GetAI_boss_maiden_of_virtue(Creature* pCreature)
{
    return new boss_maiden_of_virtueAI (pCreature);
}

void AddSC_boss_maiden_of_virtue()
{
    Script* newscript;
    newscript = new Script;
    newscript->Name = "boss_maiden_of_virtue";
    newscript->GetAI = &GetAI_boss_maiden_of_virtue;
    newscript->RegisterSelf();
}

