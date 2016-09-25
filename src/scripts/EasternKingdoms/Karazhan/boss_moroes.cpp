
#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "karazhan.h"
#include <iostream>

/*
SELECT * FROM creature_template WHERE
NAME LIKE "Moroes"
OR entry LIKE 17007
OR entry LIKE 19872
OR entry LIKE 19873
OR entry LIKE 19874
OR entry LIKE 19875
OR entry LIKE 19876

Prenerf HP:
UPDATE `world`.`creature_template` SET `minhealth`=644980, `maxhealth`=644980 WHERE  `entry`=15687;
UPDATE `world`.`creature_template` SET `minhealth`=111780, `maxhealth`=111780 WHERE  `entry`=17007;
UPDATE `world`.`creature_template` SET `minhealth`=111780, `maxhealth`=111780 WHERE  `entry`=19872;
UPDATE `world`.`creature_template` SET `minhealth`=111780, `maxhealth`=111780 WHERE  `entry`=19875;
UPDATE `world`.`creature_template` SET `minhealth`=139720, `maxhealth`=139720 WHERE  `entry`=19873;
UPDATE `world`.`creature_template` SET `minhealth`=139720, `maxhealth`=139720 WHERE  `entry`=19876;
UPDATE `world`.`creature_template` SET `minhealth`=123000, `maxhealth`=123000 WHERE  `entry`=19874;

Prenerf DMG:
UPDATE `world`.`creature_template` SET `mindmg`=5600, `maxdmg`=10000 WHERE  `entry`=15687;
UPDATE `world`.`creature_template` SET `mindmg`=3000, `maxdmg`=4000 WHERE  `entry`=17007;
UPDATE `world`.`creature_template` SET `mindmg`=3000, `maxdmg`=4000 WHERE  `entry`=19872;
UPDATE `world`.`creature_template` SET `mindmg`=3300, `maxdmg`=4500 WHERE  `entry`=19873;
UPDATE `world`.`creature_template` SET `mindmg`=3500, `maxdmg`=4500 WHERE  `entry`=19876;
UPDATE `world`.`creature_template` SET `mindmg`=3000, `maxdmg`=4000 WHERE  `entry`=19874;
UPDATE `world`.`creature_template` SET `mindmg`=3000, `maxdmg`=4000 WHERE  `entry`=19875;

Other corrects:
UPDATE `world`.`creature_template` SET `baseattacktime`=2000 WHERE  `entry`=17007;
UPDATE `world`.`creature_template` SET `baseattacktime`=2000 WHERE  `entry`=19876;
UPDATE `world`.`creature_template` SET `minlevel`=70, `maxlevel`=70 WHERE  `entry`=19874;
UPDATE `world`.`creature_template` SET `speed_run`=1.71 WHERE  `entry`=15687;
UPDATE `world`.`creature_template` SET `speed_run`=1.35 WHERE  `entry`=17007;
UPDATE `world`.`creature_template` SET `speed_run`=1.35 WHERE  `entry`=19872;
UPDATE `world`.`creature_template` SET `speed_run`=1.35 WHERE  `entry`=19873;
UPDATE `world`.`creature_template` SET `speed_run`=1.35 WHERE  `entry`=19874;
UPDATE `world`.`creature_template` SET `speed_run`=1.35 WHERE  `entry`=19875;
UPDATE `world`.`creature_template` SET `speed_run`=1.35 WHERE  `entry`=19876;
UPDATE `world`.`creature_template` SET `unit_flags`=32832 WHERE  `entry`=17007;
UPDATE `world`.`creature_template` SET `unit_flags`=32832 WHERE  `entry`=19876;

UPDATE `world`.`creature_template` SET `equipment_id`=1481 WHERE  `entry`=19876;
UPDATE `world`.`creature_template` SET `equipment_id`=4002 WHERE  `entry`=17007;
INSERT INTO `world`.`creature_equip_template_raw` (`entry`, `equipmodel1`, `equipmodel2`, `equipinfo1`, `equipinfo2`, `equipslot1`, `equipslot2`) VALUES (4002, 34109, 18698, 50267138, 33490436, 781, 1038);

UPDATE `world`.`creature_template` SET `resistance1`=24, `resistance2`=24, `resistance3`=24, `resistance4`=24, `resistance5`=24, `resistance6`=24 WHERE  `entry`=15687;
UPDATE `world`.`creature_template` SET `mechanic_immune_mask`=1055621115, `flags_extra`=65537 WHERE  `entry`=15687;
UPDATE `world`.`creature_template` SET `mechanic_immune_mask`=738410496, `flags_extra`=1 WHERE  `entry`=17007;
UPDATE `world`.`creature_template` SET `mechanic_immune_mask`=738410496, `flags_extra`=1 WHERE  `entry`=19872;
UPDATE `world`.`creature_template` SET `mechanic_immune_mask`=738410496, `flags_extra`=1 WHERE  `entry`=19873;
UPDATE `world`.`creature_template` SET `mechanic_immune_mask`=738410496, `flags_extra`=1 WHERE  `entry`=19874;
UPDATE `world`.`creature_template` SET `mechanic_immune_mask`=738410496, `flags_extra`=1 WHERE  `entry`=19875;
UPDATE `world`.`creature_template` SET `mechanic_immune_mask`=738410496, `flags_extra`=1 WHERE  `entry`=19876;

DBC:

ID 37023: Eff1BasePoints : 29 = Prenerf 30% enrage

*/

#define SAY_AGGRO           -1532011
#define SAY_SPECIAL_1       -1532012
#define SAY_SPECIAL_2       -1532013
#define SAY_KILL_1          -1532014
#define SAY_KILL_2          -1532015
#define SAY_KILL_3          -1532016
#define SAY_DEATH           -1532017

#define SPELL_VANISH        29448
#define SPELL_GARROTE       37066
#define SPELL_BLIND         34694
#define SPELL_GOUGE         29425
#define SPELL_FRENZY        37023 //29691
#define SPELL_DUALWIELD     29651
#define SPELL_DEADLYTHROW   37074


#define SPELL_MANABURN              29405
#define SPELL_MINDFLY               29570
#define SPELL_SHADOWFORM            29406
#define SPELL_DISPELMAGIC           15090                   //Self or other guest+Moroes
#define SPELL_GREATERHEAL           29564                   //Self or other guest+Moroes
#define SPELL_HOLYFIRE              29563
#define SPELL_PWSHIELD              29408
#define SPELL_CLEANSE               29380                   //Self or other guest+Moroes
#define SPELL_GREATERBLESSOFMIGHT   29381                   //Self or other guest+Moroes
#define SPELL_HOLYLIGHT             29562                   //Self or other guest+Moroes
#define SPELL_DIVINESHIELD          41367
#define SPELL_HAMMEROFJUSTICE       13005
#define SPELL_JUDGEMENTOFCOMMAND    29386
#define SPELL_SEALOFCOMMAND         29385
#define SPELL_HAMSTRING             9080
#define SPELL_MORTALSTRIKE          29572
#define SPELL_WHIRLWIND             29573
#define SPELL_DISARM                8379
#define SPELL_HEROICSTRIKE          29567
#define SPELL_SHIELDBASH            11972
#define SPELL_SHIELDWALL            29390


#define POS_Z               81.73

float Locations[4][3] =
{
	{ -10991.0, -1884.33, 0.614315 },
	{ -10989.4, -1885.88, 0.904913 },
	{ -10978.1, -1887.07, 2.035550 },
	{ -10975.9, -1885.81, 2.253890 },
};

const uint32 Adds[6] =
{
	17007,
	19872,
	19873,
	19874,
	19875,
	19876,
};  //coordy i ID addow

const uint32 Buffy[72] =
{
	25389,       // Power Word Fortitude
	25392,       // Prayer of Fortutude
	39231,        // Prayer of Fortutude
	27144, //-blessing of light                                         
	/*-greater blessing of light */        27145,
	/*-blessing of wisdom       */         27142,
	/*-greater blessing of wisdom  */      27143,
	/*-blessing of might        */         27140,
	/*-greater blessing of might */        27141,
	/*-blessing of kings        */         20217,
	/*-greater blessing of kings  */       25898,
	/*-blessing of salvation      */       1038,
	/*-greater blessing of salvation */    25895,
	/*-blessing of sanctuary      */       27168,
	/*-greater blessing of sanctuary */    27169,
	/*-blessing of sacrifice */            27148,
	/*-seal of light        */             27160,
	/*-seal of wisdom       */             27166,
	/*-seal of crusader      */            27158,
	/*-seal of righteousness  */           27155,
	/*-seal of justice        */           31895,
	/*-seal of command         */          27170,
	/*-seal of blood     (horde)*/         31892,
	/*-seal of vengeance (ally)*/          31801,
	/*-holy shield  */                     32777,
	/*-blessing of freedom */              1044,
	/*-mark of the wild  */                26990,
	/*-gift of the wild  */                26991,
	/*-thorns          */                  26992,
	/*-innervate       */                  29166,
	/*-nature's grasp  */                  27009,
	/*-barskin         */                  22812,
	/*-rejuvenation   */                   26982,
	/*-regrowth       */                   26980,
	/*-lifebloom      */                   33763,
	/*rapid fire        */                 28755,
	/*-acrane brilliance */                27127,
	/*-arcane intelect  */                 39235,
	/*-dampen magic    */                  33944,
	/*-amplify magic   */                  33946,
	/*-mana shield    */                   27131,
	/*-icy veins    */                     12472,
	/*-ice barrier  */                     33405,
	/*-fire ward  */                       27128,
	/*-frost ward   */                     32796,
	/*-clearcasting (mage)*/               12536,
	/*-arcane power  */                    12042,
	/*-presence of mind   */               12043,
	/*-slow fall   */                      130,
	/*-power word: shield  */              25218,
	/*-touch of weakness  */               25461,
	/*-divine spirit     */                25312,
	/*-prayer of spirit  */                32999,
	/*-shadow protection  */               25433,
	/*-prayer of shadow protection*/       39374,
	/*-levitate         */                 1706,
	/*-fear ward        */                 6346,
	/*-power infusion   */                 10060,
	/*-renew          */                   25222,
	/*-unending breath   */                5697,
	/*-detect invisibility */              132,
	/*-shadow ward   */                    28610,
	/*-fel armor     */                    27189,
	/*-lightning shield  */                25472,
	/*-water shield  */                    33736,
	/*-earth shield  */                    32594,
	/*-ghost wolf   */                     2645,
	/*-water breathing */                  131,
	/*-water walking */                    546,
	/*-bloodlust     */                    2825,
	/*-nature's swiftness */               16188,
	/*-healing way     */                  29202,
};

const uint32 Debuffy[41] =
{
	27011,  //Faerie Fire (Feral)
	10308,	//hammer of jusice
	20066,	//repentance
	5627,	//turn undead
	26993,	//faerie fire
	27011,	//faerie fire(feral)
	27013,	//insecty swarm
	26989,	//entangling roots
	26988,	//moonfire
	14325,	//hunter's mark
	27016,	//serpent sting
	27018,	//viper sting
	27068,	//wyvern sting
	3043,	//scorpid sting
	27024,	//immolation trap effect
	14309,	//freezing trap effect
	12826,	//polymorph
	31589,	//slow
	27187,	//deadly poison
	27189,	//wound poison
	26890,	//instant poison
	11398,	//mind-numbing poison
	11201,	//crippling poison
	25368,	//shadow word: pain
	25467,	//devouring plague
	27610,	//psychic scream
	25384,	//holy fire
	25387,	//mind flay
	34917,	//vampiric touch
	10955,	//shackle undead
	25457,	//flame shock
	23464,	//frost shock
	27216,	//corruption
	27223,	//death coil
	6215,	//fear
	27215,	//immolate
	18647,	//banish
	30405,	//unstable affliction
	30283,	//shadowfury
	17928,	//howl of terror
	27243,	//seed of corruption
};

bool BrakHPriesta;
bool BrakHPala;

//id 15687
struct boss_moroesAI : public ScriptedAI
{
	boss_moroesAI(Creature *c) : ScriptedAI(c)
	{
		for (int i = 0; i < 4; i++)
		{
			AddId[i] = 0;
			AddGUID[i] = 0;
		}
		pInstance = (ScriptedInstance*)c->GetInstanceData();

		if (pInstance)
			pInstance->SetData(TYPE_MOROES, NOT_STARTED);

	}

	ScriptedInstance *pInstance;

	uint64 AddGUID[4];
	WorldLocation wLoc;
	uint32 Vanish_Timer;
	uint32 Blind_Timer;
	uint32 Gouge_Timer;
	uint32 Wait_Timer;
	uint32 Speed;
	uint32 Berserk;
	uint32 Berserk_Timer;
	uint32 CheckAdds_Timer;
	uint32 AddId[4];
	Unit* Targetgarrote;
	uint32 CheckTimer;
	uint32 Dagger_Timer;
	bool zaplecy;
	bool InVanish;
	bool NonAttackable;
	bool Enrage;

	void Reset()
	{
		Vanish_Timer = urand(35000, 40000);
		Blind_Timer = urand(24000, 28000);
		Gouge_Timer = urand(25000, 29000);
		Wait_Timer = 0;
		CheckAdds_Timer = 2000;
		Enrage = false;
		InVanish = false;
		Speed = 2;
		Targetgarrote = 0;
		CheckTimer = 2000;
		Berserk_Timer = 660000;
		Berserk = false;
		Dagger_Timer = 3000;
		zaplecy = false;

		if (me->GetHealth() > 0)
		{
			SpawnAdds();
		}

		if (me->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE))
		{
			me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
		}

		if (pInstance && pInstance->GetData(TYPE_MOROES) != DONE)
			pInstance->SetData(TYPE_MOROES, NOT_STARTED);

	}

	void EnterCombat(Unit* who)
	{
		if (pInstance)
			pInstance->SetData(TYPE_MOROES, IN_PROGRESS);

		DoZoneInCombat();

		DoCast(me, SPELL_DUALWIELD);

		DoScriptText(SAY_AGGRO, me);
		AddsAttack();
	}

	void KilledUnit(Unit* victim)
	{
		DoScriptText(RAND(SAY_KILL_1, SAY_KILL_2, SAY_KILL_3), me);
	}

	void JustDied(Unit* victim)
	{
		DoScriptText(SAY_DEATH, me);

		if (pInstance)
			pInstance->SetData(TYPE_MOROES, DONE);


		//remove aura from spell Garrote when Moroes dies
		Map *map = me->GetMap();
		if (map->IsDungeon())
		{
			Map::PlayerList const &PlayerList = map->GetPlayers();

			if (PlayerList.isEmpty())
				return;

			for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
			{
				if (i->GetSource()->IsAlive() && i->GetSource()->HasAura(SPELL_GARROTE, 0))
					i->GetSource()->RemoveAurasDueToSpell(SPELL_GARROTE);
			}
		}
	}

	void SpawnAdds()
	{
		DeSpawnAdds();

		if (isAddlistEmpty())
		{
			Creature *pCreature = NULL;
			std::vector<uint32> AddList;

			//for(uint8 i = 0; i < 6; ++i)         //put inside AddList the ids of 6 difrent adds
			//AddList.push_back(Adds[i]);
			AddList.push_back(Adds[0]);
			AddList.push_back(Adds[1]);
			AddList.push_back(Adds[2]);
			AddList.push_back(Adds[3]);
			AddList.push_back(Adds[4]);
			AddList.push_back(Adds[5]);


			//AddList.push_back(19873);  //Prot Warrior
			//AddList.push_back(19874);  //Reti Pally
			//AddList.push_back(19872);  //Holy Priest
			//AddList.push_back(17007);  //Holy Pally
			//AddList.push_back(19875);  //Shadow Priest
			//AddList.push_back(19876);  //Arms Warrior


			while (AddList.size() > 4)
			{
				uint32 zmienna = std::rand() % AddList.size();

				AddList.erase(AddList.begin() + zmienna);  // delete 2 random guid  = 4 remain from 6
			}

			
			if(AddList[0] != 19872 && AddList[1] != 19872 && AddList[2] != 19872 && AddList[3] != 19872) // Holy Priest
			BrakHPriesta = true;
			else
			BrakHPriesta = false;

			if(AddList[0] != 17007 && AddList[1] != 17007 && AddList[2] != 17007 && AddList[3] != 17007) // Holy Pally
			BrakHPala = true;
			else
			BrakHPala = false;
			

			uint8 i = 0;
			for (std::vector<uint32>::iterator itr = AddList.begin(); itr != AddList.end(); ++itr)
			{
				uint32 entry = *itr;

				pCreature = me->SummonCreature(entry, Locations[i][0], Locations[i][1], POS_Z, Locations[i][2], TEMPSUMMON_CORPSE_TIMED_DESPAWN, 10000);
				if (pCreature)
				{
					AddGUID[i] = pCreature->GetGUID(); //Put inside AddGuid the Guids of 4 adds
					AddId[i] = entry;
				}
				++i;
			}
		}
		else
		{
			for (int i = 0; i < 4; i++)  // Spawning 4 adds
			{
				Creature *pCreature = me->SummonCreature(AddId[i], Locations[i][0], Locations[i][1], POS_Z, Locations[i][2], TEMPSUMMON_CORPSE_TIMED_DESPAWN, 10000);
				if (pCreature)
				{
					AddGUID[i] = pCreature->GetGUID();
				}
			}

		}
	}

	bool isAddlistEmpty()
	{
		for (int i = 0; i < 4; i++)
		{
			if (AddId[i] == 0)
				return true;
		}
		return false;
	}

	void DeSpawnAdds()
	{
		for (uint8 i = 0; i < 4; ++i)
		{

			Creature* Temp = NULL;
			if (AddGUID[i])
			{
				Temp = Creature::GetCreature((*me), AddGUID[i]);
				if (Temp && Temp->IsAlive())
				{
					(*Temp).GetMotionMaster()->Clear(true);
					Temp->Kill(Temp);
					Temp->RemoveCorpse();
				}
			}
		}
	}

	void AddsAttack()
	{
		for (uint8 i = 0; i < 4; ++i)
		{
			Creature* Temp = NULL;
			if (AddGUID[i])
			{
				Temp = Creature::GetCreature((*me), AddGUID[i]);
				if (Temp && Temp->IsAlive())
				{
					Temp->AI()->DoZoneInCombat();
				}
				else
					EnterEvadeMode();
			}
		}
	}

	Unit* SelectTargetGarrote()
	{
		Unit* pTarget = NULL;
		ThreatContainer::StorageType const &t_list = me->getThreatManager().getThreatList();
		std::vector<Unit* > target_list;
		for (ThreatContainer::StorageType::const_iterator itr = t_list.begin(); itr != t_list.end(); ++itr)
		{
			pTarget = Unit::GetUnit(*me, (*itr)->getUnitGuid());
			if (pTarget &&  pTarget->IsWithinDist(me, 100.0f, false) && (!pTarget->HasAura(SPELL_GARROTE)) && (pTarget->GetTypeId() == TYPEID_PLAYER))
				target_list.push_back(pTarget);
			pTarget = NULL;
		}
		if (target_list.size())
			pTarget = *(target_list.begin() + rand() % target_list.size());
		else
			pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true);
		return pTarget;
	}

	void UpdateAI(const uint32 diff)
	{
		if (!UpdateVictim())
			return;

		if (pInstance && !pInstance->GetData(TYPE_MOROES))
		{
			EnterEvadeMode();
			return;
		}

		if (CheckTimer < diff)
		{
			if (me->GetDistance2d(-10983.3, -1881.11) > 95.0f)
				EnterEvadeMode();
			else
				DoZoneInCombat();

			CheckTimer = 1000;
		}
		else
			CheckTimer -= diff;



		if (!Enrage && me->GetHealth() * 100 / me->GetMaxHealth() < 30)
		{
			DoCast(me, SPELL_FRENZY);
			Enrage = true;
		}

		if (CheckAdds_Timer < diff)
		{
			for (uint8 i = 0; i < 4; ++i)
			{
				Creature* Temp = NULL;
				if (AddGUID[i])
				{
					Temp = Unit::GetCreature((*me), AddGUID[i]);
					if (Temp && Temp->IsAlive())
					if (!Temp->GetVictim())
						Temp->AI()->AttackStart(me->GetVictim());
				}
			}
			CheckAdds_Timer = 1000;
		}
		else
			CheckAdds_Timer -= diff;


		if (Vanish_Timer < diff)
		{
			Targetgarrote = SelectTargetGarrote();

			if (Targetgarrote)
			{
				DoScriptText(RAND(SAY_SPECIAL_1, SAY_SPECIAL_2), me);
				DoCast(me, SPELL_VANISH);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);

				Vanish_Timer = urand(30000, 45000);
				InVanish = true;
				zaplecy = true;
				Wait_Timer = (me->GetDistance2d(Targetgarrote)) * 200;

				if (Wait_Timer < 3000)
					Wait_Timer = 3000;


			}
		}
		else
			Vanish_Timer -= diff;



		if (InVanish)
		{
			int32 ang = Targetgarrote->GetAngle(Targetgarrote->GetPositionX(), Targetgarrote->GetPositionY());

			if (zaplecy)
			{
				me->GetMotionMaster()->MoveChase(Targetgarrote, 1.0f, ang);
				zaplecy = false;
			}

			if (Wait_Timer < diff)
			{
				me->RemoveAurasDueToSpell(SPELL_VANISH);
				Targetgarrote->CastSpell(Targetgarrote, SPELL_GARROTE, true);
				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
				InVanish = false;

				Gouge_Timer = urand(13000, 21000);
				Blind_Timer = urand(13000, 21000);

				Unit * tar = me->GetVictim();

				me->GetMotionMaster()->MoveChase(tar, 1.0f, tar->GetAngle(tar->GetPositionX(), tar->GetPositionY()));
			}
			else
				Wait_Timer -= diff;
		}



		if (Gouge_Timer < diff)
		{
			Unit* target = me->GetVictim();
			if (target)
			{
				DoCast(target, SPELL_GOUGE, false);
				Gouge_Timer = urand(200000, 250000);
			}
		}
		else
			Gouge_Timer -= diff;

		if (Blind_Timer < diff)
		{
			if (Unit* target = SelectTarget(SELECT_TARGET_NEAREST, 0, GetSpellMaxRange(SPELL_BLIND), true))
			{
				if (target && !(target->HasAura(SPELL_GOUGE)))
				{
					DoCast(target, SPELL_BLIND, false);
					Blind_Timer = urand(200000, 250000);
				}
			}
		}
		else
			Blind_Timer -= diff;


		if (Berserk)
		{
			if (Dagger_Timer < diff)
			{
				DoCast(SelectTarget(SELECT_TARGET_RANDOM, 0, 100.0f, true), SPELL_DEADLYTHROW, false);
				Dagger_Timer = 3000;
			}
			else
				Dagger_Timer -= diff;
		}
		else
		{
			if (Berserk_Timer < diff)
			{
				Berserk = true;
				DoCast(me, SPELL_FRENZY);
			}
			else
				Berserk_Timer -= diff;
		}

		if (!InVanish)
		{
			DoMeleeAttackIfReady();
		}
	}
};


struct boss_moroes_guestAI : public ScriptedAI
{
	ScriptedInstance* pInstance;
	uint32 CheckTimer;
	uint64 GuestGUID[5];


	boss_moroes_guestAI(Creature* c) : ScriptedAI(c)
	{
		for (uint8 i = 1; i < 5; ++i)
			GuestGUID[i] = 0;

		pInstance = (ScriptedInstance*)c->GetInstanceData();

	}

	void SpellHit(Unit* caster, const SpellEntry *Spell)
	{
		if ((Spell->Id == 5246) ||
			(Spell->Id == 7093) ||
			(Spell->Id == 20511) ||
			(Spell->Id == 8122) ||
			(Spell->Id == 8122) ||
			(Spell->Id == 8124) ||
			(Spell->Id == 10888) ||
			(Spell->Id == 10890) ||
			(Spell->Id == 6789) ||
			(Spell->Id == 17825) ||
			(Spell->Id == 17926) ||
			(Spell->Id == 27223) ||
			(Spell->Id == 5484) ||
			(Spell->Id == 17928) ||
			(Spell->Id == 5782) ||
			(Spell->Id == 6215) || (Spell->Id == 6213)
			)
		{
			me->RemoveAurasDueToSpell(Spell->Id);
			caster->SendSpellMiss(me, Spell->Id, SPELL_MISS_IMMUNE);
		}
	}

	void Reset()
	{
		CheckTimer = 2000;
		if (pInstance)
			pInstance->SetData(TYPE_MOROES, NOT_STARTED);
	}

	void AcquireGUID()
	{
		if (!pInstance)
			return;

		GuestGUID[0] = pInstance->GetData64(DATA_MOROES);


		Creature* Moroes = (Unit::GetCreature((*me), GuestGUID[0]));

		if (Moroes)
		{
			for (uint8 i = 0; i < 4; ++i)
			{

				uint64 GUID = ((boss_moroesAI*)Moroes->AI())->AddGUID[i];


				if (GUID)
					GuestGUID[i + 1] = GUID;
			}

		}
	}

	void EnterCombat(Unit* who)
	{
		if (pInstance)
			pInstance->SetData(TYPE_MOROES, IN_PROGRESS);

		DoZoneInCombat();

		GuestGUID[0] = pInstance->GetData64(DATA_MOROES);

		Creature* Moroes = (Unit::GetCreature((*me), GuestGUID[0]));

		if (Moroes)
			Moroes->AI()->DoZoneInCombat();
	}

	Unit* SelectTargetWithMagicDebuff()
	{
		for (uint8 i = 0; i < 5; ++i)
		{
			uint64 TempGUID = GuestGUID[i];
			if (TempGUID)
			{
				Unit* pUnit = Unit::GetUnit((*me), TempGUID);
				if (pUnit && pUnit->IsAlive() && (me->GetDistance2d(pUnit) <= 30.0f))
				{
					for (uint8 i = 0; i < 41; ++i)
					{
						uint64 WybranyDebuff = Debuffy[i];
						if (pUnit->HasAura(WybranyDebuff))
						{
							return pUnit;
						}
					}
				}
			}
		}
		return 0;

	}

	Unit* SelectTargetWithMagicBuff()
	{
		if (Unit * target = SelectTarget(SELECT_TARGET_RANDOM, 0, 30.0f, true, 0))
		{
			for (uint8 i = 0; i < 72; ++i)
			{
				uint64 WybranyBuff = Buffy[i];
				if (target->HasAura(WybranyBuff))
					return target;
			}
		}
		return 0;
	}

	Unit* SelectTargettoManaBurn()
	{
		Unit* pTarget = NULL;
		ThreatContainer::StorageType const &t_list = me->getThreatManager().getThreatList();
		std::vector<Unit* > target_list;
		for (ThreatContainer::StorageType::const_iterator itr = t_list.begin(); itr != t_list.end(); ++itr)
		{
			pTarget = Unit::GetUnit(*me, (*itr)->getUnitGuid());
			if (pTarget &&  pTarget->IsWithinDist(me, 30.0f, false) && (pTarget->GetPower(POWER_MANA)) && (pTarget->IsWithinLOSInMap(me)) && (pTarget->GetTypeId() == TYPEID_PLAYER))
				target_list.push_back(pTarget);
			pTarget = NULL;
		}
		if (target_list.size())
			pTarget = *(target_list.begin() + rand() % target_list.size());

		return pTarget;
	}

	Unit* SelectFriendlyCCTarget()
	{
		//DoFindFriendlyCC
		for (uint8 i = 0; i < 5; ++i)
		{
			uint64 TempGUID = GuestGUID[i];
			if (TempGUID)
			{
				Unit* pUnit = Unit::GetUnit((*me), TempGUID);
				if (pUnit && pUnit->IsAlive() && !pUnit->CanFreeMove()) //pUnit->HasUnitState(UNIT_STATE_CONTROLLED)
					if(me->GetDistance2d(pUnit) <= 30.0f)
						return pUnit;
			}
		}
		return 0;
	}

	Unit* Injured()
	{
		//DoSelectLowestHpFriendly(
		Unit* Themostijured = 0;
		uint64 hppercent = 100;
		for (uint8 i = 0; i < 5; ++i)
		{

			uint64 TempGUID = GuestGUID[i];
			if (TempGUID)
			{
				Unit* pUnit = Unit::GetUnit((*me), TempGUID);
				if (pUnit && pUnit->IsAlive() && (!pUnit->IsFullHealth()))
				{
					if (pUnit->GetHealthPct() < hppercent)
					{
						hppercent = pUnit->GetHealthPct();
						Themostijured = pUnit;
					}
				}

			}
		}

		if (Themostijured)
		{
			if (me->GetDistance2d(Themostijured) <= 30.0f)
				return Themostijured;
		}
		return 0;
	}


	Unit* SelectTargetShieldBash()
	{
		Unit* pTarget = NULL;
		ThreatContainer::StorageType const &t_list = me->getThreatManager().getThreatList();
		std::vector<Unit* > target_list;
		for (ThreatContainer::StorageType::const_iterator itr = t_list.begin(); itr != t_list.end(); ++itr)
		{
			pTarget = Unit::GetUnit(*me, (*itr)->getUnitGuid());
			if (pTarget &&  pTarget->IsWithinDist(me, 5.0f, false) && (pTarget->GetPower(POWER_MANA)) && (pTarget->HasUnitState(UNIT_STATE_CASTING)) && (pTarget->GetTypeId() == TYPEID_PLAYER))
				target_list.push_back(pTarget);
			pTarget = NULL;
		}
		if (target_list.size())
			pTarget = *(target_list.begin() + rand() % target_list.size());

		return pTarget;
	}

	void UpdateAI(const uint32 diff)
	{
		if (CheckTimer < diff)
		{
				if (me->GetDistance2d(-10983.3, -1881.11) > 95.0f)
				{
					Creature* Moroes = (Unit::GetCreature((*me), GuestGUID[0]));
					if (Moroes)
						Moroes->AI()->EnterEvadeMode();
					EnterEvadeMode();
				}

			CheckTimer = 1000;
			DoZoneInCombat();

		}
		else
			CheckTimer -= diff;

		DoMeleeAttackIfReady();
	}
};






// Shadow Priest 19875    //done
struct boss_baroness_dorothea_millstipeAI : public boss_moroes_guestAI
{

	boss_baroness_dorothea_millstipeAI(Creature *c) : boss_moroes_guestAI(c) {}

	uint32 ManaBurn_Timer;
	uint32 MindFlay_Timer;
	uint32 Shadowform_Timer;
	uint32 DispelMagic_Timer;

	void EnterCombat(Unit* who)
	{
		AcquireGUID();
	}

	void Reset()
	{
		DispelMagic_Timer = 2000;
		ManaBurn_Timer = urand(8000, 15000);
		MindFlay_Timer = urand(2000, 4000);
		Shadowform_Timer = urand(1000, 7000);
		boss_moroes_guestAI::Reset();
	}

	void UpdateAI(const uint32 diff)
	{
		if (!UpdateVictim())
			return;

		if (!(me->HasAura(SPELL_SHADOWFORM)))
			DoCast(me, SPELL_SHADOWFORM, true);

		boss_moroes_guestAI::UpdateAI(diff);

		if (MindFlay_Timer < diff)
		{
			if (!me->HasUnitState(UNIT_STATE_CASTING))
			{
				DoCast(me->GetVictim(), SPELL_MINDFLY, false); //3sec channeled
				MindFlay_Timer = urand(4000, 9000);
			}
		}
		else MindFlay_Timer -= diff;

		if (ManaBurn_Timer < diff)
		{
			Unit* target = SelectTargettoManaBurn();
			if (target && !me->HasUnitState(UNIT_STATE_CASTING))
			{
				DoCast(target, SPELL_MANABURN, false);
				ManaBurn_Timer = urand(8000, 15000);
			}

		}
		else ManaBurn_Timer -= diff;

		if (BrakHPriesta)
		{
		
			if (DispelMagic_Timer < diff)
			{
				Unit* target = SelectFriendlyCCTarget();
				if (!target)
					target = SelectTargetWithMagicDebuff();
				if (!target)
					target = SelectTargetWithMagicBuff();

				if (target)
				{
					if (!me->HasUnitState(UNIT_STATE_CASTING))
					{
						DoCast(target, SPELL_DISPELMAGIC, false);
						DispelMagic_Timer = 5000;
					}
				}

			}
			else DispelMagic_Timer -= diff;
		}

	}
};


//Holy Priest 19872  //done
struct boss_lady_catriona_von_indiAI : public boss_moroes_guestAI
{
	boss_lady_catriona_von_indiAI(Creature *c) : boss_moroes_guestAI(c) {}

	uint32 DispelMagic_Timer;
	uint32 GreaterHeal_Timer;
	uint32 HolyFire_Timer;
	uint32 PowerWordShield_Timer;

	void EnterCombat(Unit* who)
	{
		AcquireGUID();
	}

	void Reset()
	{

		DispelMagic_Timer = 2000;
		GreaterHeal_Timer = 12000;
		HolyFire_Timer = 4000;
		PowerWordShield_Timer = 10000;


		boss_moroes_guestAI::Reset();
	}

	void UpdateAI(const uint32 diff)
	{
		if (!UpdateVictim())
			return;

		boss_moroes_guestAI::UpdateAI(diff);

		if (PowerWordShield_Timer < diff)
		{
			if (!me->HasUnitState(UNIT_STATE_CASTING))
			{
				DoCast(Injured(), SPELL_PWSHIELD, false);
				PowerWordShield_Timer = urand(15000, 20000);
			}
		}
		else PowerWordShield_Timer -= diff;

		if (GreaterHeal_Timer < diff)
		{
			if (!me->HasUnitState(UNIT_STATE_CASTING))
			{
				if (!me->HasUnitState(UNIT_STATE_CASTING))
				{
					DoCast(Injured(), SPELL_GREATERHEAL, false);
					GreaterHeal_Timer = urand(20000, 30000);
				}
			}
		}
		else GreaterHeal_Timer -= diff;

		if (HolyFire_Timer < diff)
		{
			if (!me->HasUnitState(UNIT_STATE_CASTING))
			{
				DoCast(me->GetVictim(), SPELL_HOLYFIRE, false);
				HolyFire_Timer = urand(14000, 18000);
			}
		}
		else HolyFire_Timer -= diff;


		if (DispelMagic_Timer < diff)
		{
			//Unit* target = SelectFriendlyCCTarget();

			Unit* target = SelectTargetWithMagicBuff();
			if (target)
			{
				if (!me->HasUnitState(UNIT_STATE_CASTING))
				{
					DoCast(target, SPELL_DISPELMAGIC, false);
					DispelMagic_Timer = 5000;
				}
			}


		}
		else DispelMagic_Timer -= diff;

	}
};


//Holy Pally 17007   //Done  
struct boss_lady_keira_berrybuckAI : public boss_moroes_guestAI
{

	boss_lady_keira_berrybuckAI(Creature *c) : boss_moroes_guestAI(c)  {}

	uint32 Cleanse_Timer;
	uint32 GreaterBless_Timer;
	uint32 HolyLight_Timer;
	uint32 DivineShield_Timer;

	void EnterCombat(Unit* who)
	{
		AcquireGUID();
	}

	void Reset()
	{
		Cleanse_Timer = 5000;
		GreaterBless_Timer = urand(10000, 12000);
		HolyLight_Timer = 7000;
		DivineShield_Timer = 1000;

		boss_moroes_guestAI::Reset();
	}

	void UpdateAI(const uint32 diff)
	{
		if (!UpdateVictim())
			return;

		boss_moroes_guestAI::UpdateAI(diff);

		if (DivineShield_Timer < diff)
		{
			if (me->GetHealth() * 100 / me->GetMaxHealth() < 20)
			{
				if (!me->HasUnitState(UNIT_STATE_CASTING))
				{
					DoCast(me, SPELL_DIVINESHIELD);
					DivineShield_Timer = urand(40000, 50000);
				}
			}
		}
		else DivineShield_Timer -= diff;

		if (HolyLight_Timer < diff)
		{
			if (!me->HasUnitState(UNIT_STATE_CASTING))
			{
				DoCast(Injured(), SPELL_HOLYLIGHT, false);
				HolyLight_Timer = urand(8000, 12000);
			}
		}
		else HolyLight_Timer -= diff;

		if (GreaterBless_Timer < diff)
		{
			if (!me->HasUnitState(UNIT_STATE_CASTING))
			{
				DoCast(me, SPELL_GREATERBLESSOFMIGHT);
				if (me->HasAura(SPELL_GREATERBLESSOFMIGHT))
					GreaterBless_Timer = urand(30000, 35000);
			}
		}
		else GreaterBless_Timer -= diff;

		if (Cleanse_Timer < diff)
		{

			Unit* target = SelectFriendlyCCTarget();

			if (!target)
				target = SelectTargetWithMagicDebuff();

			if (target)
			{
				if (!me->HasUnitState(UNIT_STATE_CASTING))
				{
					DoCast(target, SPELL_CLEANSE, false);
					Cleanse_Timer = 5000;
				}
			}

		}
		else Cleanse_Timer -= diff;
	}
};


// Reti Pally 19874              //DONE
struct boss_baron_rafe_dreugerAI : public boss_moroes_guestAI
{

	boss_baron_rafe_dreugerAI(Creature *c) : boss_moroes_guestAI(c){}

	uint32 Cleanse_Timer;
	//uint32 GreaterBless_Timer;
	uint32 HammerOfJustice_Timer;
	uint32 SealOfCommand_Timer;
	uint32 JudgementOfCommand_Timer;
	uint32 HolyLight_Timer;

	void EnterCombat(Unit* who)
	{
		AcquireGUID();
	}

	void Reset()
	{
		Cleanse_Timer = 5000;
		//GreaterBless_Timer = urand(10000, 12000);
		HammerOfJustice_Timer = 2000;
		SealOfCommand_Timer = 1000;
		JudgementOfCommand_Timer = 9000;
		HolyLight_Timer = 7000;

		boss_moroes_guestAI::Reset();
	}

	void UpdateAI(const uint32 diff)
	{
		if (!UpdateVictim())
			return;

		boss_moroes_guestAI::UpdateAI(diff);

		if (SealOfCommand_Timer < diff)
		{
			if (!me->HasUnitState(UNIT_STATE_CASTING))
			{
				DoCast(me, SPELL_SEALOFCOMMAND);
				SealOfCommand_Timer = urand(15000, 30000);
			}
		}
		else SealOfCommand_Timer -= diff;

		if (JudgementOfCommand_Timer < diff)
		{
			if (!me->HasUnitState(UNIT_STATE_CASTING))
			{
				DoCast(me->GetVictim(), SPELL_JUDGEMENTOFCOMMAND, false);
				JudgementOfCommand_Timer = urand(20000, 30000);
			}
		}
		else JudgementOfCommand_Timer -= diff;

		if (HammerOfJustice_Timer < diff)
		{
			if (!me->HasUnitState(UNIT_STATE_CASTING))
			{
				DoCast(me->GetVictim(), SPELL_HAMMEROFJUSTICE, false);
				HammerOfJustice_Timer = urand(25000, 35000);
			}
		}
		else HammerOfJustice_Timer -= diff;

		if (BrakHPala)
		{
			/*
			if (GreaterBless_Timer < diff)
			{
				DoCast(me, SPELL_GREATERBLESSOFMIGHT);
				if (me->HasAura(SPELL_GREATERBLESSOFMIGHT))
					GreaterBless_Timer = urand(30000, 35000);
			}
			else GreaterBless_Timer -= diff;
			*/

			if (Cleanse_Timer < diff)
			{
				if (!me->HasUnitState(UNIT_STATE_CASTING))
				{
					Unit* target = SelectFriendlyCCTarget();

					if (!target)
						target = SelectTargetWithMagicDebuff();

					if (target)
					{
						DoCast(target, SPELL_CLEANSE, false);
						Cleanse_Timer = 5000;
					}
				}

			}
			else Cleanse_Timer -= diff;
		}

		if (BrakHPriesta)
		{
			if (HolyLight_Timer < diff)
			{
				if (!me->HasUnitState(UNIT_STATE_CASTING))
				{
					DoCast(Injured(), SPELL_HOLYLIGHT, false);
					HolyLight_Timer = urand(8000, 12000);
				}
			}
			else HolyLight_Timer -= diff;
		}

	}
};


//Arms Warrior 19876        // DONE
struct boss_lord_robin_darisAI : public boss_moroes_guestAI
{
	boss_lord_robin_darisAI(Creature *c) : boss_moroes_guestAI(c) {}

	uint32 Hamstring_Timer;
	uint32 MortalStrike_Timer;
	uint32 WhirlWind_Timer;

	void Reset()
	{
		Hamstring_Timer = 7000;
		MortalStrike_Timer = 10000;
		WhirlWind_Timer = 15000;

		boss_moroes_guestAI::Reset();
	}

	void UpdateAI(const uint32 diff)
	{
		if (!UpdateVictim())
			return;

		boss_moroes_guestAI::UpdateAI(diff);

		if (Hamstring_Timer < diff)
		{
			if (!me->HasUnitState(UNIT_STATE_CASTING))
			{
				DoCast(me->GetVictim(), SPELL_HAMSTRING, false);
				Hamstring_Timer = urand(10000, 20000);
			}
		}
		else Hamstring_Timer -= diff;

		if (MortalStrike_Timer < diff)
		{
			if (!me->HasUnitState(UNIT_STATE_CASTING))
			{
				DoCast(me->GetVictim(), SPELL_MORTALSTRIKE, false);
				MortalStrike_Timer = urand(15000, 25000);
			}
		}
		else MortalStrike_Timer -= diff;

		if (WhirlWind_Timer < diff)
		{
			if (!me->HasUnitState(UNIT_STATE_CASTING))
			{
				DoCast(me, SPELL_WHIRLWIND);
				WhirlWind_Timer = urand(15000, 20000);
			}
		}
		else WhirlWind_Timer -= diff;
	}
};


//Prot Warrior 19873        //Done
struct boss_lord_crispin_ferenceAI : public boss_moroes_guestAI
{
	boss_lord_crispin_ferenceAI(Creature *c) : boss_moroes_guestAI(c) {}

	uint32 Disarm_Timer;
	uint32 HeroicStrike_Timer;
	uint32 ShieldBash_Timer;
	uint32 ShieldWall_Timer;

	void Reset()
	{
		Disarm_Timer = 6000;
		HeroicStrike_Timer = 10000;
		ShieldBash_Timer = 8000;
		ShieldWall_Timer = 1000;

		boss_moroes_guestAI::Reset();
	}

	void UpdateAI(const uint32 diff)
	{
		if (!UpdateVictim())
			return;

		boss_moroes_guestAI::UpdateAI(diff);

		if (Disarm_Timer < diff)
		{
			if (!me->HasUnitState(UNIT_STATE_CASTING))
			{
				DoCast(me->GetVictim(), SPELL_DISARM, false);
				Disarm_Timer = urand(25000, 35000);
			}
		}
		else Disarm_Timer -= diff;

		if (HeroicStrike_Timer < diff)
		{
			if (!me->HasUnitState(UNIT_STATE_CASTING))
			{
				DoCast(me->GetVictim(), SPELL_HEROICSTRIKE, false);
				HeroicStrike_Timer = urand(10000, 20000);
			}
		}
		else HeroicStrike_Timer -= diff;

		if (ShieldBash_Timer < diff)
		{
			if (!me->HasUnitState(UNIT_STATE_CASTING))
			{
				Unit* target = SelectTargetShieldBash();
				if (!target)
					target = SelectTarget(SELECT_TARGET_RANDOM, 0, 5.0f, true, 0);

				if (target && target->HasUnitState(UNIT_STATE_CASTING))
				{
					me->SetTarget(target->GetGUID());
					me->SetInFront(target);
					DoCast(target, SPELL_SHIELDBASH, false);
					ShieldBash_Timer = urand(10000, 14000);;
				}
			}

		}
		else ShieldBash_Timer -= diff;

		if (me->GetHealth() * 100 / me->GetMaxHealth() < 50)
		{
			if (ShieldWall_Timer < diff)
			{
				if (!me->HasUnitState(UNIT_STATE_CASTING))
				{
					DoCast(me, SPELL_SHIELDWALL);
					ShieldWall_Timer = 180000;
				}
			}
			else ShieldWall_Timer -= diff;
		}
	}
};


CreatureAI* GetAI_boss_moroes(Creature *_Creature)
{
	return new boss_moroesAI(_Creature);
}

CreatureAI* GetAI_baroness_dorothea_millstipe(Creature *_Creature)
{
	return new boss_baroness_dorothea_millstipeAI(_Creature);
}

CreatureAI* GetAI_baron_rafe_dreuger(Creature *_Creature)
{
	return new boss_baron_rafe_dreugerAI(_Creature);
}

CreatureAI* GetAI_lady_catriona_von_indi(Creature *_Creature)
{
	return new boss_lady_catriona_von_indiAI(_Creature);
}

CreatureAI* GetAI_lady_keira_berrybuck(Creature *_Creature)
{
	return new boss_lady_keira_berrybuckAI(_Creature);
}

CreatureAI* GetAI_lord_robin_daris(Creature *_Creature)
{
	return new boss_lord_robin_darisAI(_Creature);
}

CreatureAI* GetAI_lord_crispin_ference(Creature *_Creature)
{
	return new boss_lord_crispin_ferenceAI(_Creature);
}

void AddSC_boss_moroes()
{
	Script *newscript;

	newscript = new Script;
	newscript->Name = "boss_moroes";
	newscript->GetAI = &GetAI_boss_moroes;
	newscript->RegisterSelf();

	newscript = new Script;
	newscript->Name = "boss_baroness_dorothea_millstipe";
	newscript->GetAI = &GetAI_baroness_dorothea_millstipe;
	newscript->RegisterSelf();

	newscript = new Script;
	newscript->Name = "boss_baron_rafe_dreuger";
	newscript->GetAI = &GetAI_baron_rafe_dreuger;
	newscript->RegisterSelf();

	newscript = new Script;
	newscript->Name = "boss_lady_catriona_von_indi";
	newscript->GetAI = &GetAI_lady_catriona_von_indi;
	newscript->RegisterSelf();

	newscript = new Script;
	newscript->Name = "boss_lady_keira_berrybuck";
	newscript->GetAI = &GetAI_lady_keira_berrybuck;
	newscript->RegisterSelf();

	newscript = new Script;
	newscript->Name = "boss_lord_robin_daris";
	newscript->GetAI = &GetAI_lord_robin_daris;
	newscript->RegisterSelf();

	newscript = new Script;
	newscript->Name = "boss_lord_crispin_ference";
	newscript->GetAI = &GetAI_lord_crispin_ference;
	newscript->RegisterSelf();
}