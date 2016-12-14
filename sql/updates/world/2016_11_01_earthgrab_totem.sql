UPDATE `creature_template` SET `AIName` = "SmartAI", `ScriptName` = "" WHERE `entry` = 6066;
DELETE FROM `smart_scripts` WHERE  `entryorguid`=6066;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(6066, 0, 0, 0, 0, 0, 100, 0, 1000, 1000, 4800, 5200, 11, 8377, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Earthgrab Totem - In Combat - Cast \'Earthgrab\''),
(6066, 0, 1, 2, 4, 0, 100, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Earthgrab Totem - On Agro - Auto attack off'),
(6066, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Earthgrab Totem - On Agro - Disable Combat Movement');
