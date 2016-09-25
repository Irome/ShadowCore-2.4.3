/*
REWRITTEN BY Lee
IT Now is sick as aids!
*/


#include "ScriptMgr.h"
#include "ScriptedCreature.h"




#define SAY_INTRO                       -1557000

#define SAY_AGGRO_1                     -1557001
#define SAY_AGGRO_2                     -1557002
#define SAY_AGGRO_3                     -1557003

#define SAY_SLAY_1                      -1557004
#define SAY_SLAY_2                      -1557005

#define SAY_SUMMON                      -1557006

#define SAY_DEAD                        -1557007

#define SPELL_BLINK  34605
#define	SPELL_FROSTBOLT  32364
#define	SPELL_FIREBALL  32363
#define	SPELL_FROSTNOVA  32365

#define	SPELL_ETHEREAL_BEACON  32371                // Summons NPC_BEACON
#define	SPELL_ETHEREAL_BEACON_VISUAL  32368

#define	NPC_BEACON  18431
#define	NPC_SHAFFAR  18344
#define EVENT_SPELL_BEACON  1
#define EVENT_SPELL_FR_FI  2
#define EVENT_SPELL_FROST_NOVA  3
#define EVENT_SPELL_BLINK  4
#define NR_INITIAL_BEACONS 3




struct boss_nexusprince_shaffarAI : public ScriptedAI
{
	boss_nexusprince_shaffarAI(Creature* c) : ScriptedAI(c) {}

	uint32 Blink_Timer;
	uint32 Beacon_Timer;
	uint32 FireBall_Timer;
	uint32 Frostbolt_Timer;
	uint32 FrostNova_Timer;
	Creature* Beacon[NR_INITIAL_BEACONS];
	EventMap events;
	bool HasTaunted;
	bool CanBlink;

	void RemoveBeaconFromList(Creature* targetBeacon)
	{
		for (uint8 i = 0; i < NR_INITIAL_BEACONS; i++)
			if (Beacon[i] && Beacon[i]->GetGUID() == targetBeacon->GetGUID())
				Beacon[i] = NULL;
	}

	void Reset()
	{
		Blink_Timer = 1500;
		Beacon_Timer = 10000;
		FireBall_Timer = 8000;
		Frostbolt_Timer = 4000;
		FrostNova_Timer = 15000;

		HasTaunted = false;
		CanBlink = false;

		float dist = 8.0f;
		float posX, posY, posZ, angle;
		me->GetHomePosition(posX, posY, posZ, angle);


		events.Reset();
		Beacon[0] = me->SummonCreature(NPC_BEACON, posX - dist, posY - dist, posZ, angle, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 7200000);
		Beacon[1] = me->SummonCreature(NPC_BEACON, posX - dist, posY + dist, posZ, angle, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 7200000);
		Beacon[2] = me->SummonCreature(NPC_BEACON, posX + dist, posY, posZ, angle, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 7200000);
	}

	void EnterEvadeMode()
	{
		//Despawn still living initial beacons.
		for (uint8 i = 0; i < NR_INITIAL_BEACONS; i++)
		{
			if (Beacon[i] && Beacon[i]->IsAlive())
			{
				Beacon[i]->RemoveAllAuras();
				Beacon[i]->CombatStop();
				Beacon[i]->StopMoving();
				Beacon[i]->Kill(Beacon[i]);
			}
		}
		ScriptedAI::EnterEvadeMode();
	}


	void MoveInLineOfSight(Unit* who)
	{
		if (!HasTaunted && who->GetTypeId() == TYPEID_PLAYER && me->IsWithinDistInMap(who, 100.0f))
		{
			DoScriptText(SAY_INTRO, me);
			HasTaunted = true;
		}
	}

	void EnterCombat(Unit* who)
	{
		DoScriptText(SAY_AGGRO_1, me), me;

		me->SetInCombatWithZone();


		events.ScheduleEvent(EVENT_SPELL_BEACON, 10000);
		events.ScheduleEvent(EVENT_SPELL_FR_FI, 4000);
		events.ScheduleEvent(EVENT_SPELL_FROST_NOVA, 15000);
	}

	void JustSummoned(Creature* summoned)
	{
		if (summoned->GetEntry() == NPC_BEACON)
		{
			summoned->CastSpell(summoned, SPELL_ETHEREAL_BEACON_VISUAL, false);

			if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0))
				summoned->AI()->AttackStart(pTarget);
		}
	}



	void KilledUnit(Unit* victim)
	{
		if (victim->GetTypeId() == TYPEID_PLAYER)
			DoScriptText(SAY_SLAY_1, me);
	}

	void JustDied(Unit* /*killer*/)
	{
		DoScriptText(SAY_DEAD, me);
		{
			if (Creature* Shaffar = me->FindNearestCreature(NPC_SHAFFAR, 100))
				((boss_nexusprince_shaffarAI*)(CAST_CRE(Shaffar)->AI()))->RemoveBeaconFromList(me);
		}

	}

	void UpdateAI(uint32 diff)
	{
		if (!UpdateVictim())
			return;

		if (FrostNova_Timer <= diff)
		{
			if (me->IsNonMeleeSpellCast(false))
				me->InterruptNonMeleeSpells(true);

			DoCast(me, SPELL_FROSTNOVA);
			FrostNova_Timer = 17500 + rand() % 7500;
			CanBlink = true;
		}
		else FrostNova_Timer -= diff;

		if (Frostbolt_Timer <= diff)
		{
			DoCastVictim(SPELL_FROSTBOLT);
			Frostbolt_Timer = 4500 + rand() % 1500;
		}
		else Frostbolt_Timer -= diff;

		if (FireBall_Timer <= diff)
		{
			DoCastVictim(SPELL_FIREBALL);
			FireBall_Timer = 4500 + rand() % 1500;
		}
		else FireBall_Timer -= diff;

		if (CanBlink)
		{
			if (Blink_Timer <= diff)
			{
				if (me->IsNonMeleeSpellCast(false))
					me->InterruptNonMeleeSpells(true);

				DoCast(me, SPELL_BLINK);
				Blink_Timer = 1000 + rand() % 1500;
				CanBlink = false;
			}
			else Blink_Timer -= diff;
		}

		if (Beacon_Timer <= diff)
		{
			if (me->IsNonMeleeSpellCast(false))
				me->InterruptNonMeleeSpells(true);

			if (!urand(0, 3))
				DoScriptText(SAY_SUMMON, me);

			DoCast(me, SPELL_ETHEREAL_BEACON);

			Beacon_Timer = 10000;
		}
		else Beacon_Timer -= diff;

		DoMeleeAttackIfReady();
	}


};



CreatureAI* GetAI_boss_nexusprince_shaffar(Creature* pCreature)
{
	return new boss_nexusprince_shaffarAI(pCreature);
}

#define SPELL_ARCANE_BOLT               15254
#define SPELL_ETHEREAL_APPRENTICE       32372               // Summon 18430

struct mob_ethereal_beaconAI : public ScriptedAI
{
	mob_ethereal_beaconAI(Creature* c) : ScriptedAI(c)
	{
		HeroicMode = me->GetMap()->IsHeroic();
	}

	bool HeroicMode;
	uint32 Apprentice_Timer;
	uint32 ArcaneBolt_Timer;
	uint32 Check_Timer;

	void KillSelf()
	{
		me->Kill(me);
	}

	void Reset()
	{
		Apprentice_Timer = (HeroicMode ? 10000 : 20000);
		ArcaneBolt_Timer = 1000;
		Check_Timer = 1000;
	}

	void EnterCombat(Unit* who)
	{
		// Send Shaffar to fight
		Creature* Shaffar = me->FindNearestCreature(NPC_SHAFFAR, 100);
		if (!Shaffar || Shaffar->isDead())
		{
			KillSelf();
			return;
		}
		if (!Shaffar->IsInCombat())
			Shaffar->AI()->AttackStart(who);
	}

	void JustSummoned(Creature* summoned)
	{
		summoned->AI()->AttackStart(me->GetVictim());
	}

	void JustDied(Unit*)
	{
		if (Creature* Shaffar = me->FindNearestCreature(NPC_SHAFFAR, 100))
			((boss_nexusprince_shaffarAI*)(CAST_CRE(Shaffar)->AI()))->RemoveBeaconFromList(me);
	}

	void UpdateAI(const uint32 diff)
	{
		if (!UpdateVictim())
			return;

		if (Check_Timer <= diff)
		{
			Creature* Shaffar = me->FindNearestCreature(NPC_SHAFFAR, 100);
			if (!Shaffar || Shaffar->isDead() || !Shaffar->IsInCombat())
			{
				KillSelf();
				return;
			}
			Check_Timer = 1000;
		}
		else Check_Timer -= diff;

		if (ArcaneBolt_Timer <= diff)
		{
			DoCastVictim(SPELL_ARCANE_BOLT);
			ArcaneBolt_Timer = 2000 + rand() % 2500;
		}
		else ArcaneBolt_Timer -= diff;

		if (Apprentice_Timer <= diff)
		{
			if (me->IsNonMeleeSpellCast(false))
				me->InterruptNonMeleeSpells(true);

			me->CastSpell(me, SPELL_ETHEREAL_APPRENTICE, true);
			if (me->IsPet())
				((Pet*)me)->SetDuration(0);
			KillSelf();
			return;
		}
		else Apprentice_Timer -= diff;
	}
};

CreatureAI* GetAI_mob_ethereal_beacon(Creature* pCreature)
{
	return new mob_ethereal_beaconAI(pCreature);
}

#define SPELL_ETHEREAL_APPRENTICE_FIREBOLT          32369
#define SPELL_ETHEREAL_APPRENTICE_FROSTBOLT         32370

struct mob_ethereal_apprenticeAI : public ScriptedAI
{
	mob_ethereal_apprenticeAI(Creature* c) : ScriptedAI(c) {}

	uint32 Cast_Timer;

	bool isFireboltTurn;

	void Reset()
	{
		Cast_Timer = 3000;
		isFireboltTurn = true;
	}

	void EnterCombat(Unit*) {}

	void UpdateAI(const uint32 diff)
	{
		if (!UpdateVictim())
			return;

		if (Cast_Timer <= diff)
		{
			if (isFireboltTurn)
			{
				me->CastSpell(me->GetVictim(), SPELL_ETHEREAL_APPRENTICE_FIREBOLT, true);
				isFireboltTurn = false;
			}
			else
			{
				me->CastSpell(me->GetVictim(), SPELL_ETHEREAL_APPRENTICE_FROSTBOLT, true);
				isFireboltTurn = true;
			}
			Cast_Timer = 3000;
		}
		else Cast_Timer -= diff;
	}
};

CreatureAI* GetAI_mob_ethereal_apprentice(Creature* pCreature)
{
	return new mob_ethereal_apprenticeAI(pCreature);
}

void AddSC_boss_nexusprince_shaffar()
{
	Script* newscript;

	newscript = new Script;
	newscript->Name = "boss_nexusprince_shaffar";
	newscript->GetAI = &GetAI_boss_nexusprince_shaffar;
	newscript->RegisterSelf();

	newscript = new Script;
	newscript->Name = "mob_ethereal_beacon";
	newscript->GetAI = &GetAI_mob_ethereal_beacon;
	newscript->RegisterSelf();

	newscript = new Script;
	newscript->Name = "mob_ethereal_apprentice";
	newscript->GetAI = &GetAI_mob_ethereal_apprentice;
	newscript->RegisterSelf();
}