//https://www.youtube.com/watch?v=xT-NDyVyI7w - video how prenerf boss should work

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "karazhan.h"

/*
emotes text in database: select * from script_texts where entry BETWEEN -1532010 and -1532000 
sql updates for Midnight:
UPDATE `world`.`creature_template` SET `flags_extra`=65537 WHERE  `entry`=16151;
UPDATE `world`.`creature_template` SET `mechanic_immune_mask`=1055621115 WHERE  `entry`=16151;
UPDATE `world`.`creature_template` SET `speed_run`=1.71 WHERE  `entry`=16151;
UPDATE `world`.`creature_template` SET `mindmg`=3268 WHERE  `entry`=16151;
UPDATE `world`.`creature_template` SET `maxdmg`=4621 WHERE  `entry`=16151;
UPDATE `world`.`creature_template` SET `resistance1`=24, `resistance2`=24, `resistance3`=24, `resistance4`=24, `resistance5`=24, `resistance6`=24 WHERE  `entry`=16151;

sql updates for Attumen:
UPDATE `world`.`creature_template` SET `mechanic_immune_mask`=1055621115 WHERE  `entry`=16152;
UPDATE `world`.`creature_template` SET `flags_extra`=65537 WHERE  `entry`=16152;
UPDATE `world`.`creature_template` SET `speed_run`=1.71 WHERE  `entry`=16152;
UPDATE `world`.`creature_template` SET `armor`=7685 WHERE  `entry`=16152;
UPDATE `world`.`creature_template` SET `mindmg`=3627, `maxdmg`=5775, `baseattacktime`=2000 WHERE  `entry`=16152;
UPDATE `world`.`creature_template` SET `resistance1`=24, `resistance2`=24, `resistance3`=24, `resistance4`=24, `resistance5`=24, `resistance6`=24 WHERE  `entry`=16152;
INSERT INTO `world`.`creature_equip_template_raw` (`entry`, `equipmodel1`, `equipinfo1`, `equipslot1`) VALUES (4001, 18342, 33490946, 273);
UPDATE `world`.`creature_template` SET `equipment_id`=4001 WHERE  `entry`=16152;

UPDATE `world`.`creature_template` SET `mechanic_immune_mask`=1055621115 WHERE  `entry`=15550;
UPDATE `world`.`creature_template` SET `flags_extra`=65537 WHERE  `entry`=15550;
UPDATE `world`.`creature_template` SET `speed_run`=1.71 WHERE  `entry`=15550;
UPDATE `world`.`creature_template` SET `armor`=7685 WHERE  `entry`=15550;
UPDATE `world`.`creature_template` SET `mindmg`=3627, `maxdmg`=5775, `baseattacktime`=2000 WHERE  `entry`=15550;
UPDATE `world`.`creature_template` SET `resistance1`=24, `resistance2`=24, `resistance3`=24, `resistance4`=24, `resistance5`=24, `resistance6`=24 WHERE  `entry`=15550;
INSERT INTO `world`.`creature_equip_template_raw` (`entry`, `equipmodel1`, `equipinfo1`, `equipslot1`) VALUES (4000, 18342, 33490946, 273);
UPDATE `world`.`creature_template` SET `equipment_id`=4000 WHERE  `entry`=15550;

DBC changes:
ID 29847: Column Effect2[67] = 2  {was 58} - its remove instant 6000 physical dmg from charge
ID 29832: Column ElfImplicitTargetA[87] = 15 {was 1} - add 360 degree to charge.
ID 29832: Column Elf1Radius[93] = 7 cleave range
ID 29832: Column elf1ChainTarget[105] = 2 additional targets get hit by spell (main target + 2 others = 3)
ID 29832: Column SpellTargets[202] = 0x3 - number of jumps of chain dmg.

*/

#define SAY_MIDNIGHT_KILL           -1532000
#define SAY_APPEAR1                 -1532001
#define SAY_APPEAR2                 -1532002
#define SAY_APPEAR3                 -1532003
#define SAY_MOUNT                   -1532004
#define SAY_KILL1                   -1532005
#define SAY_KILL2                   -1532006
#define SAY_DISARMED                -1532007
#define SAY_DEATH                   -1532008
#define SAY_RANDOM1                 -1532009
#define SAY_RANDOM2                 -1532010

//skills
#define SPELL_SHADOWCLEAVE          29832
#define SPELL_INTANGIBLE_PRESENCE   29833
#define SUMMON_ATTUMEN_SPELL		29714
#define SUMMON_ATTUMEN				15550
#define SPELL_BERSERKER_CHARGE      29847                   //old bad id 26561 
#define SPELL_FIXATE_CHARGE			34719
#define SPELL_UPPER_CUT_ATTU		29850
#define SPELL_KNOCKDOWN				29711

#define MOUNTED_DISPLAYID           16040

bool reset;

struct boss_midnightAI : public ScriptedAI
{
	boss_midnightAI(Creature *c) : ScriptedAI(c)
	{
		pInstance = (ScriptedInstance*)c->GetInstanceData();
		KnockTimer = urand(1000, 20000);
		biegnie = 0;
	}
	
	ScriptedInstance* pInstance;

	uint64 Attumen;
	uint8 Phase;
	uint32 Mount_Timer;
	uint32 CheckTimer;
	uint32 KnockTimer;
	uint32 biegnie;

	float angle;
	float distance;
	float newX;
	float newY;
	float newZ;

	void Reset()
	{
		Phase = 1;
		Mount_Timer = 0;
		CheckTimer = 1000;
		biegnie = 0;
		distance = 0;
		reset = 0;
		me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
		me->SetVisible(true);
		me->setFaction(7);

		if (pInstance)
			pInstance->SetData(TYPE_ATTUMEN, NOT_STARTED);

		if (Creature *pUnit = Creature::GetCreature(*me, Attumen))
		{
			pUnit->SetVisible(false);
			pUnit->DeleteFromDB();
			pUnit->AddObjectToRemoveList();
		}
		Attumen = 0;
	}

	void JustDied(Unit*)
	{
		if (pInstance)
			pInstance->SetData(TYPE_ATTUMEN, DONE);
	}

	void EnterCombat(Unit* who)
	{
		me->setFaction(16);
		if (pInstance)
			pInstance->SetData(TYPE_ATTUMEN, IN_PROGRESS);
		DoZoneInCombat();

	}

	void KilledUnit(Unit *victim)
	{
		if (Phase == 2)
		if (Unit *pUnit = Unit::GetUnit(*me, Attumen))
			DoScriptText(SAY_MIDNIGHT_KILL, pUnit);
	}

	void UpdateAI(const uint32 diff)
	{
		if (!UpdateVictim())
			return;

		if (CheckTimer < diff)
		{
			if (me->GetDistance2d(-11126, -1929) > 40)
			{
				me->SetHealth(me->GetMaxHealth());
				EnterEvadeMode();
			}

			if (reset)
			{
				me->SetHealth(me->GetMaxHealth());
				EnterEvadeMode();
				reset = 0;
			}

			CheckTimer = 1000;
		}
		else
			CheckTimer -= diff;

		switch (Phase)
		{
		case 1:
		{
				  if ((me->GetHealth() * 100) / me->GetMaxHealth() < 95)
				  {
					  Phase = 2;
					  Creature *pAttumen = me->SummonCreature(SUMMON_ATTUMEN, me->GetPositionX() + urand(1, 3), me->GetPositionY() + urand(1, 3), me->GetPositionZ() + 1, 0, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 30000);
					  if (pAttumen)
					  {
						  Attumen = pAttumen->GetGUID();
						  SetMidnight(pAttumen, me->GetGUID());
						  DoScriptText(RAND(SAY_APPEAR1, SAY_APPEAR2, SAY_APPEAR3), pAttumen);
					  }
				  }
				  break;
		}
		case 2:
		{
				  if ((me->GetHealth() * 100) / me->GetMaxHealth() < 25)
				  if (Unit *pAttumen = Unit::GetUnit(*me, Attumen))
				  {
					  Mount(pAttumen);
				  }
				  break;
		}
		case 3:
		{
				  if (Mount_Timer)
				  {
					  if (Mount_Timer <= diff)
					  {
						  Mount_Timer = 0;
						  me->SetVisible(false);
						  me->GetMotionMaster()->MoveIdle();
						  if (Creature *pAttumen = Unit::GetCreature(*me, Attumen))
						  {
							  pAttumen->SetUInt32Value(UNIT_FIELD_DISPLAYID, MOUNTED_DISPLAYID);
							  pAttumen->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
							  if (pAttumen->GetVictim())
							  {
								  pAttumen->GetMotionMaster()->MoveChase(pAttumen->GetVictim());
								  pAttumen->GetVictim();

							  }
							  pAttumen->SetFloatValue(OBJECT_FIELD_SCALE_X, 1);
						  }
					  }
					  else
						  Mount_Timer -= diff;
				  }
				  return;
		}
		}
		if (KnockTimer < diff)
		{
			DoCast(me->GetVictim(), SPELL_KNOCKDOWN);
			KnockTimer = urand(20000, 30000);
		}
		else
			KnockTimer -= diff;

		DoMeleeAttackIfReady();
	}

	void Mount(Unit *pAttumen)
	{

		if (!biegnie)
		{
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
			pAttumen->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
			DoScriptText(SAY_MOUNT, pAttumen);
			angle = me->GetAngle(pAttumen);
			distance = me->GetDistance2d(pAttumen);
			newX = me->GetPositionX() + cos(angle)*(distance);
			newY = me->GetPositionY() + sin(angle)*(distance);
			newZ = 50;
			me->GetMotionMaster()->Clear();
			biegnie = 1;
			me->GetMotionMaster()->MovePoint(0, newX, newY, newZ);
		}
		if (biegnie)
		{
			Phase = 3;
			if (distance > 3)
				Mount_Timer = distance * 50;
			else
				Mount_Timer = 1000;
		}

	}

	void SetMidnight(Creature *, uint64);              
};

CreatureAI* GetAI_boss_midnight(Creature *_Creature)
{
	return new boss_midnightAI(_Creature);
}

struct boss_attumenAI : public ScriptedAI
{
	boss_attumenAI(Creature *c) : ScriptedAI(c)
	{

	}

	ScriptedInstance *pInstance;

	uint32 UpperCut;
	uint64 Midnight;
	uint8 Phase;
	uint32 CleaveTimer;
	uint32 CurseTimer;
	uint32 CheckTimer;
	uint32 RandomYellTimer;
	uint32 ChargeTimer;
	uint32 UpperCutTimer;
	uint32 Szarza;
	uint32 KnockTimer;
	uint32 Atacktimer;
	float Chargedistance;

	void Reset()
	{
		Phase = 1;
		CheckTimer = 0;
		CleaveTimer = urand(10000, 16000);
		CurseTimer = 20000;
		RandomYellTimer = urand(30000, 61000);
		ChargeTimer = urand(15000, 30000);
		UpperCutTimer = urand(2000, 4000);
		KnockTimer = urand(1000, 20000);
		Szarza = 0;
		Atacktimer = 1400;
		UpperCut = 0;
	}

	void EnterCombat(Unit* who)
	{

	}

	void KilledUnit(Unit *victim)
	{
		DoScriptText(RAND(SAY_KILL1, SAY_KILL2), me);
	}

	void JustDied(Unit *victim)
	{
		DoScriptText(SAY_DEATH, me);
		if (Unit *pMidnight = Unit::GetUnit(*me, Midnight))
			pMidnight->Kill(pMidnight);
	}

	void UpdateAI(const uint32 diff)
	{
		if (CheckTimer < diff)
		{
			if (me->GetDistance2d(-11126, -1929) > 40)
			{
				
				if (Unit *pMidnight = Unit::GetUnit(*me, Midnight))
				{
					me->SetVisible(false);
					me->DeleteFromDB();
					me->AddObjectToRemoveList();
					reset = 1;
				}
			}
			
			DoZoneInCombat();
				
			CheckTimer = 1000;
		}
		else
			CheckTimer -= diff;

		if (Szarza)
		{
			if (Atacktimer < diff)
			{
				Atacktimer = 1400;
				Szarza = 0;
			}
			else
			{
				DoMeleeAttackIfReady();
				Atacktimer -= diff;
				return;
			}
		}

		if (!UpdateVictim())
		{
			if ((me->GetHealth() * 100) / me->GetMaxHealth() >= 25)
			{
				me->SetVisible(false);
				me->DeleteFromDB();
				me->AddObjectToRemoveList();
			}
			if (me->GetUInt32Value(UNIT_FIELD_DISPLAYID) == MOUNTED_DISPLAYID)
			{
				me->SetVisible(false);
				me->DeleteFromDB();
				me->AddObjectToRemoveList();
			}
		}

		if (me->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE))
		{
			return;
		}



		if (CleaveTimer < diff)
		{
			DoCast(me->GetVictim(), SPELL_SHADOWCLEAVE);
			CleaveTimer = urand(10000, 16000);
		}
		else
			CleaveTimer -= diff;

		if (CurseTimer < diff)
		{
			DoCast(me->GetVictim(), SPELL_INTANGIBLE_PRESENCE);

			CurseTimer = 30000;
		}
		else
			CurseTimer -= diff;

		if (RandomYellTimer < diff)
		{
			DoScriptText(RAND(SAY_RANDOM1, SAY_RANDOM2), me);
			RandomYellTimer = urand(30000, 61000);
		}
		else
			RandomYellTimer -= diff;

		if (me->GetUInt32Value(UNIT_FIELD_DISPLAYID) == MOUNTED_DISPLAYID)
		{

			if (ChargeTimer < diff)
			{
				Unit* pTarget = NULL;
				ThreatContainer::StorageType const &t_list = me->getThreatManager().getThreatList();
				std::vector<Unit* > target_list;
				for (ThreatContainer::StorageType::const_iterator itr = t_list.begin(); itr != t_list.end(); ++itr)
				{
					pTarget = Unit::GetUnit(*me, (*itr)->getUnitGuid());
					if (pTarget && !pTarget->IsWithinDist(me, 8.0f, false) && pTarget->IsWithinDist(me, 25.0f, false) && (pTarget->GetTypeId() == TYPEID_PLAYER) && (pTarget->IsWithinLOSInMap(me)))
						target_list.push_back(pTarget);
					pTarget = NULL;
				}
				if (target_list.size())
					pTarget = *(target_list.begin() + rand() % target_list.size());

				if (pTarget)
				{
							Szarza = 1;
							me->GetMotionMaster()->MoveChase(pTarget);
							me->SetTarget(pTarget->GetGUID());
							me->AI()->AttackStart(pTarget);
							me->SetInFront(pTarget);
							me->SetUInt64Value(UNIT_FIELD_TARGET, pTarget->GetGUID());
							DoCast(pTarget, SPELL_BERSERKER_CHARGE);
							
				}
				else
				{
						Unit * target = SelectTarget(SELECT_TARGET_RANDOM, 0, 5, true);
						if (target)
						{
							DoCast(target, SPELL_UPPER_CUT_ATTU);
						}
				}
				    ChargeTimer = urand(15000, 30000);
			}
			else
				ChargeTimer -= diff;

			if (KnockTimer < diff)
			{
				DoCast(me->GetVictim(), SPELL_KNOCKDOWN);
				DoMeleeAttackIfReady();
				KnockTimer = urand(20000, 40000);
			}
			else
				KnockTimer -= diff;
		}
		else
		{
			if ((me->GetHealth() * 100) / me->GetMaxHealth() < 25)
			{
				Creature *pMidnight = Unit::GetCreature(*me, Midnight);
				if (pMidnight && pMidnight->GetTypeId() == TYPEID_UNIT)
				{
					((boss_midnightAI*)(pMidnight->AI()))->Mount(me);
					me->SetHealth(pMidnight->GetHealth());
					DoResetThreat();
				}
			}
		}

		DoMeleeAttackIfReady();
	}

	void SpellHit(Unit *source, const SpellEntry *spell)
	{
		if (spell->Mechanic == MECHANIC_DISARM)
		{
			DoScriptText(SAY_DISARMED, me);
		}
	}

};

void boss_midnightAI::SetMidnight(Creature *pAttumen, uint64 value)
{
	((boss_attumenAI*)pAttumen->AI())->Midnight = value;
}

CreatureAI* GetAI_boss_attumen(Creature *_Creature)
{
	return new boss_attumenAI(_Creature);
}

void AddSC_boss_attumen()
{
	Script *newscript;
	newscript = new Script;
	newscript->Name = "boss_attumen";
	newscript->GetAI = &GetAI_boss_attumen;
	newscript->RegisterSelf();

	newscript = new Script;
	newscript->Name = "boss_midnight";
	newscript->GetAI = &GetAI_boss_midnight;
	newscript->RegisterSelf();
}