UPDATE `creature_template` SET `AIName`= 'SmartAI',`speed_run`=1.428571 WHERE `entry` IN(16027);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN(16027) AND `source_type`=0;

INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `bytes2`, `auras`) VALUES
(16027, 0, 0x0, 0x1, '18950'); -- 16027 - 18950

INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(16027, 0, 0, 1, 10, 1, 100, 1, 0, 1, 0, 0, 19, 256, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Living Poison - OOC LOS - Remove Unit Flags Immune to PC (Phase 1)'),
(16027, 0, 1, 0, 61, 1, 100, 1, 0, 0, 0, 0, 11, 28433, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Living Poison - OOC LOS - Cast Explode (Phase 1)'),
(16027, 0, 2, 3, 54, 0, 100, 1, 0, 0, 0, 0, 18, 256, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Living Poison - On Just Summoned - Set Unit Flags Immune to PC'),
(16027, 0, 3, 4, 61, 0, 100, 1, 0, 0, 0, 0, 46, 35, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Living Poison - On Just Summoned - Move Forward'),
(16027, 0, 4, 0, 61, 0, 100, 1, 0, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Living Poison - On Just Summoned - Set Phase 1');

INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES 
(1400000, 16027, 533, 3, 0, 0, 3128.625, -3119.719, 293.408, 4.738929, 7200, 0, 0, 0, 0, 0),
(1400001, 16027, 533, 3, 0, 0, 3154.55, -3126.288, 293.6176, 4.430199, 7200, 0, 0, 0, 0, 0),
(1400002, 16027, 533, 3, 0, 0, 3175.281, -3134.764, 293.4368, 4.244924, 7200, 0, 0, 0, 0, 0);

INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(1400000, 0, 0, 0, 1, 0, 100, 0, 0, 0, 3333, 3333, 12, 16027, 1, 8000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Living Poison - OOC - Spawn Living Poison'),
(1400001, 0, 0, 0, 1, 0, 100, 0, 0, 0, 3333, 3333, 12, 16027, 1, 8000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Living Poison - OOC - Spawn Living Poison'),
(1400002, 0, 0, 0, 1, 0, 100, 0, 0, 0, 3333, 3333, 12, 16027, 1, 8000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Living Poison - OOC - Spawn Living Poison'),
(1400000, 0, 1, 2, 11, 0, 100, 0, 0, 0, 0, 0, 18, 256, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Living Poison - On Spawn - Set Unit Flags Immune to PC'),
(1400001, 0, 1, 2, 11, 0, 100, 0, 0, 0, 0, 0, 18, 256, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Living Poison - On Spawn - Set Unit Flags Immune to PC'),
(1400002, 0, 1, 2, 11, 0, 100, 0, 0, 0, 0, 0, 18, 256, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Living Poison - On Spawn - Set Unit Flags Immune to PC'),
(1400000, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 47, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Living Poison - On Spawn - Set Invisible'),
(1400001, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 47, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Living Poison - On Spawn - Set Invisible'),
(1400002, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 47, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Living Poison - On Spawn - Set Invisible');