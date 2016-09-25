/*
* Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
* Copyright (C) 2006-2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
*
* This program is free software; you can redistribute it and/or modify it
* under the terms of the GNU General Public License as published by the
* Free Software Foundation; either version 2 of the License, or (at your
* option) any later version.
*
* This program is distributed in the hope that it will be useful, but WITHOUT
* ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
* FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
* more details.
*
* You should have received a copy of the GNU General Public License along
* with this program. If not, see <http://www.gnu.org/licenses/>.
*/

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "SpellAuras.h"
#include "blood_furnace.h"

enum Kelidan
{
	SAY_WAKE = -1542000,
	SAY_ADD_AGGRO = -1542001,
	SAY_KILL = -1542004,
	SAY_NOVA = -1542006,
	SAY_DIE = -1542007,

	SPELL_CORRUPTION = 30938,
	SPELL_EVOCATION = 30935,

	SPELL_FIRE_NOVA = 33132,
	H_SPELL_FIRE_NOVA = 37371,

	SPELL_SHADOW_BOLT_VOLLEY = 28599,
	H_SPELL_SHADOW_BOLT_VOLLEY = 40070,

	SPELL_BURNING_NOVA = 30940,
	SPELL_VORTEX = 37370,
	SPELL_CHANNELING = 39123,

	ENTRY_KELIDAN = 17377,
	ENTRY_CHANNELER = 17653,

	ACTION_ACTIVATE_ADDS = 92
};

const float ShadowmoonChannelers[5][4] =
{
	{ 302.0f, -87.0f, -24.4f, 0.157f },
	{ 321.0f, -63.5f, -24.6f, 4.887f },
	{ 346.0f, -74.5f, -24.6f, 3.595f },
	{ 344.0f, -103.5f, -24.5f, 2.356f },
	{ 316.0f, -109.0f, -24.6f, 1.257f }
};

class BurningNovaAura : public Aura
{
public:
	BurningNovaAura(SpellEntry* spell, uint32 eff, Unit* pTarget, Unit* caster) : Aura(spell, eff, NULL, pTarget, caster, NULL) {}
};



	struct boss_kelidan_the_breakerAI : public ScriptedAI
	{
		boss_kelidan_the_breakerAI(Creature* creature) : ScriptedAI(creature)
		{
			Initialize();
			Firenova_Timer = 0;
			memset(&Channelers, 0, sizeof(Channelers));
			
		}

		void Initialize()
		{
			ShadowVolley_Timer = 1000;
			BurningNova_Timer = 15000;
			Corruption_Timer = 5000;
			check_Timer = 0;
			Firenova = false;
			addYell = false;
		}

		uint32 ShadowVolley_Timer;
		
		EventMap events;
		uint32 BurningNova_Timer;
		uint32 Firenova_Timer;
		uint32 Corruption_Timer;
		uint32 check_Timer;
		bool Firenova;
		bool addYell;
		ObjectGuid Channelers[5];
		

		void Reset() override
		{
		
			Initialize();
			SummonChannelers();
			me->SetReactState(REACT_PASSIVE);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_IMMUNE_TO_NPC | UNIT_FLAG_NON_ATTACKABLE);
		}

		void EnterCombat(Unit* who) override
		{
			
			DoScriptText(SAY_WAKE, me);
			if (me->IsNonMeleeSpellCast(false))
				me->InterruptNonMeleeSpells(true);
			DoStartMovement(who);
		}

		void KilledUnit(Unit* /*victim*/) override
		{
			if (rand32() % 2)
				return;

			DoScriptText(SAY_KILL, me);
		}

		void ChannelerEngaged(Unit* who)
		{
			if (who && !addYell)
			{
				addYell = true;
				DoScriptText(SAY_ADD_AGGRO, me);
			}
			for (uint8 i = 0; i<5; ++i)
			{
				Creature* channeler = ObjectAccessor::GetCreature(*me, Channelers[i]);
				if (who && channeler && !channeler->IsInCombat())
					channeler->AI()->AttackStart(who);
			}
		}

		void ChannelerDied(Unit* killer)
		{
			for (uint8 i = 0; i < 5; ++i)
			{
				Creature* channeler = ObjectAccessor::GetCreature(*me, Channelers[i]);
				if (channeler && channeler->IsAlive())
					return;
			}
			me->SetReactState(REACT_AGGRESSIVE);
			me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_IMMUNE_TO_NPC | UNIT_FLAG_NON_ATTACKABLE);
			if (killer)
				AttackStart(killer);
		}


		ObjectGuid GetChanneled(Creature* channeler1)
		{
			SummonChannelers();
			if (!channeler1)
				return 0;

			uint8 i;
			for (i = 0; i < 5; ++i)
			{
				Creature* channeler = ObjectAccessor::GetCreature(*me, Channelers[i]);
				if (channeler && channeler->GetGUID() == channeler1->GetGUID())
					break;
			}
			return Channelers[(i + 2) % 5];
		}

		void CheckChannelers()
		{
			if (addYell)
			{
				if (!SelectTargetFromPlayerList(100.0f))
					EnterEvadeMode();
				return;
			}

			SummonChannelers();
			for (uint8 i = 0; i < 5; ++i)
			{
				Creature* Channeler = ObjectAccessor::GetCreature(*me, Channelers[i]);
				if (Channeler && !Channeler->HasUnitState(UNIT_STATE_CASTING) && !Channeler->IsInCombat())
				{
					Creature* target = ObjectAccessor::GetCreature(*me, Channelers[(i + 2) % 5]);
					if (target)
						Channeler->CastSpell(target, SPELL_CHANNELING, false);
				}
			}
		}


		void SummonChannelers()
		{
			for (int i = 0; i < 5; ++i)
			{
				Creature* channeler = Unit::GetCreature(*me, Channelers[i]);
				if (!channeler || channeler->isDead())
					channeler = me->SummonCreature(ENTRY_CHANNELER, ShadowmoonChannelers[i][0], ShadowmoonChannelers[i][1], ShadowmoonChannelers[i][2], ShadowmoonChannelers[i][3], TEMPSUMMON_CORPSE_TIMED_DESPAWN, 300000);
				if (channeler)
					Channelers[i] = channeler->GetGUID();
				else
					Channelers[i] = 0;
			}
		}

		void JustDied(Unit* /*killer*/) override
		{
			
			DoScriptText(SAY_DIE, me);
		}

		void UpdateAI(uint32 diff) override
		{
			if (!UpdateVictim())
			{
				if (check_Timer <= diff)
				{
					if (!me->IsNonMeleeSpellCast(false))
						DoCast(me, SPELL_EVOCATION);
					check_Timer = 5000;
				}
				else
					check_Timer -= diff;
				return;
			}

			if (Firenova)
			{
				if (Firenova_Timer <= diff)
				{
					DoCast(me, SPELL_FIRE_NOVA, true);
					Firenova = false;
					ShadowVolley_Timer = 2000;
				}
				else
					Firenova_Timer -= diff;

				return;
			}

			if (ShadowVolley_Timer <= diff)
			{
				DoCast(me, SPELL_SHADOW_BOLT_VOLLEY);
				ShadowVolley_Timer = 5000 + rand32() % 8000;
			}
			else
				ShadowVolley_Timer -= diff;

			if (Corruption_Timer <= diff)
			{
				DoCast(me, SPELL_CORRUPTION);
				Corruption_Timer = 30000 + rand32() % 20000;
			}
			else
				Corruption_Timer -= diff;

			if (BurningNova_Timer <= diff)
			{
				if (me->IsNonMeleeSpellCast(false))
					me->InterruptNonMeleeSpells(true);

				DoScriptText(SAY_NOVA, me);
				if (SpellEntry* nova = GET_SPELL(SPELL_BURNING_NOVA))
				{
					for (uint32 i = 0; i < 3; ++i)
						if (nova->Effect[i] == SPELL_EFFECT_APPLY_AURA)
						{
							Aura* Aur = new BurningNovaAura(nova, i, me, me);
							me->AddAura(Aur);
						}
				}

				if (HeroicMode)
					DoTeleportAll(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), me->GetOrientation());

				BurningNova_Timer = 20000 + rand32() % 8000;
				Firenova_Timer = 5000;
				Firenova = true;
			}
			else
				BurningNova_Timer -= diff;

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI_boss_kelidan_the_breaker(Creature* pCreature)
	{
		return new boss_kelidan_the_breakerAI(pCreature);
	}


/*######
## npc_shadowmoon_channeler
######*/

enum Shadowmoon
{
	SPELL_SHADOW_BOLT = 12739,
	H_SPELL_SHADOW_BOLT = 15472,

	SPELL_MARK_OF_SHADOW = 30937
	
};


	struct mob_shadowmoon_channelerAI : public ScriptedAI
	{
		mob_shadowmoon_channelerAI(Creature* creature) : ScriptedAI(creature)
		{
			Initialize();
		}

		void Initialize()
		{
			ShadowBolt_Timer = 1000 + rand32() % 1000;
			MarkOfShadow_Timer = 5000 + rand32() % 2000;
			check_Timer = 0;
		}

		uint32 ShadowBolt_Timer;
		uint32 MarkOfShadow_Timer;
		uint32 check_Timer;

		void Reset() override
		{
			Initialize();
			if (me->IsNonMeleeSpellCast(false))
				me->InterruptNonMeleeSpells(true);
		}

		void EnterCombat(Unit* who) override
		{
			if (Creature* Kelidan = me->FindNearestCreature(ENTRY_KELIDAN, 100))
				CAST_AI(boss_kelidan_the_breakerAI, Kelidan->AI())->ChannelerEngaged(who);
			if (me->IsNonMeleeSpellCast(false))
				me->InterruptNonMeleeSpells(true);
			DoStartMovement(who);
		}

		void JustDied(Unit* killer) override
		{
			if (Creature* Kelidan = me->FindNearestCreature(ENTRY_KELIDAN, 100))
				CAST_AI(boss_kelidan_the_breakerAI, Kelidan->AI())->ChannelerDied(killer);
		}

		void UpdateAI(uint32 diff) override
		{
			if (!UpdateVictim())
			{
				if (check_Timer <= diff)
				{
					if (!me->IsNonMeleeSpellCast(false))
					{
						if (Creature* Kelidan = me->FindNearestCreature(ENTRY_KELIDAN, 100))
						{
							uint64 channeler = CAST_AI(boss_kelidan_the_breakerAI, Kelidan->AI())->GetChanneled(me);
							if (Unit* channeled = ObjectAccessor::GetUnit(*me, channeler))
								DoCast(channeled, SPELL_CHANNELING);
						}
					}
					check_Timer = 5000;
				}
				else
					check_Timer -= diff;

				return;
			}

			if (MarkOfShadow_Timer <= diff)
			{
				if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
					DoCast(target, SPELL_MARK_OF_SHADOW);
				MarkOfShadow_Timer = 15000 + rand32() % 5000;
			}
			else
				MarkOfShadow_Timer -= diff;

			if (ShadowBolt_Timer <= diff)
			{
				DoCastVictim(SPELL_SHADOW_BOLT);
				ShadowBolt_Timer = 5000 + rand32() % 1000;
			}
			else
				ShadowBolt_Timer -= diff;

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI_mob_shadowmoon_channeler(Creature* pCreature)
	{
		return new mob_shadowmoon_channelerAI(pCreature);
	}


	void AddSC_boss_kelidan_the_breaker()
	{
		Script* newscript;

		newscript = new Script;
		newscript->Name = "boss_kelidan_the_breaker";
		newscript->GetAI = &GetAI_boss_kelidan_the_breaker;
		newscript->RegisterSelf();

		newscript = new Script;
		newscript->Name = "mob_shadowmoon_channeler";
		newscript->GetAI = &GetAI_mob_shadowmoon_channeler;
		newscript->RegisterSelf();
	};