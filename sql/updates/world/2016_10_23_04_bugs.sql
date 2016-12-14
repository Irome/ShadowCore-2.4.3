DELETE FROM `creature` WHERE `guid` IN (86353, 86352); -- remove unnecessary Bugs
UPDATE `creature_template` SET `minhealth` = 42, `maxhealth` = 42, `AIName` = "SmartAI" WHERE `entry` = 7732;
UPDATE `creature_template` SET `rank` = 1, `minhealth` = 4700, `maxhealth` = 4700 WHERE `entry` = 6231; 
UPDATE `smart_scripts` SET `link` = 4 WHERE `entryorguid` = 6231 AND `id` = 3;

DELETE FROM `smart_scripts` WHERE `entryorguid` = 6231 AND `id` = 4;
INSERT INTO `smart_scripts` VALUES
(6231, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 10860, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Techbot - In Combat - Cast Patch'),
(7732, 0, 0, 0, 1, 0, 100, 0, 60000, 60000, 10000, 11000, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dupe Bug - 60s OOC - Despawn');
