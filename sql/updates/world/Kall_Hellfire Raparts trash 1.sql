DELETE FROM `creature_formations` WHERE `leaderGUID` = "62013";
DELETE FROM `creature_formations` WHERE `leaderGUID` = "8001648";
DELETE FROM `creature_ai_scripts` WHERE `id` = "1747813";
DELETE FROM `creature_ai_scripts` WHERE `id` = "19228176"; 
DELETE FROM `creature_ai_scripts` WHERE `id` = "19228175"; 
DELETE FROM `creature_ai_scripts` WHERE `id` = "19228174"; 
DELETE FROM `creature_ai_scripts` WHERE `id` = "19228173";
DELETE FROM `creature_ai_scripts` WHERE `id` = "19228172";

-- Ramparts Bonechewer with dogs 1st patrol
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES 
(62013, 62013, 0, 0, 2),
(62013, 62066, 2, 90, 2),
(62013, 62065, 2, 270, 2);

-- Ramparts Bonechewer with dogs 2nd patrol
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(8001648, 8001648, 0, 0, 2),
(8001648, 8001644, 2, 90, 2),
(8001648, 8001642, 2, 270, 2);


UPDATE `creature_addon` SET `isActive`=1 WHERE  `guid`=8001954;
UPDATE `creature_addon` SET `bytes1`=8 WHERE  `guid`=8001954;
UPDATE `creature_ai_scripts` SET `action2_type`=0, `action2_param1`=0 WHERE `id`=1739701;
UPDATE `creature_ai_scripts` SET `action1_type`=0, `action1_param1`=0 WHERE `id`=1739705;
UPDATE `creature` SET `guid`=138155 WHERE `guid`=8003870;



-- Bleeding Hollow Scryer

INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES 
(1747813, 17478, 6, 0, 100, 6, 8003147, 30, 8003141, 0, 11, 30659, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Bleeding Hollow Scryer - Cast Fel Infusion'),
(19228176, 17478, 6, 0, 100, 6, 8003147, 30, 8003143, 0, 11, 30659, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Bleeding Hollow Scryer - Cast Fel Infusion'),
(19228175, 17478, 6, 0, 100, 6, 8003147, 30, 8003145, 0, 11, 30659, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Bleeding Hollow Scryer - Cast Fel Infusion'),
(19228174, 17478, 29, 0, 100, 6, 8003147, 3, 8003145, 10000, 11, 31059, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Bleeding Hollow Scryer - Hellfire Channeling'),
(19228173, 17478, 29, 0, 100, 6, 8003147, 3, 8003143, 10000, 11, 31059, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Bleeding Hollow Scryer - Hellfire Channeling'),
(19228172, 17478, 29, 0, 100, 6, 8003147, 3, 8003141, 10000, 11, 31059, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Bleeding Hollow Scryer - Hellfire Channeling');
