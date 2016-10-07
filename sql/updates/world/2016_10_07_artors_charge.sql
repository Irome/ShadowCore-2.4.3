UPDATE `creature_template` SET `faction` = 495, `AIName`= "SmartAI" WHERE `entry`= 21332; -- Spirit Hunter
UPDATE `creature_template` SET `faction` = 16, `AIName` = "SmartAI" WHERE `entry`= 20427; -- Veneratus
UPDATE `creature_template` SET `AIName` = "SmartAI" WHERE `entry` = 21318; -- Spirit of Ar'tor

DELETE FROM `smart_scripts` WHERE `entryorguid` = 21318 AND `id` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (21332,20427);
INSERT INTO `smart_scripts` VALUES
(21318, 0, 0, 0, 19, 0, 100, 1, 10540, 0, 0, 0, 85, 36620, 4, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Spirit of Ar'tor - on quest accept - summon Spirit hunter"),
(20427, 0, 0, 0,  6, 0, 100, 0, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 11, 21332, 10, 0, 0, 0, 0, 0, "Veneratus - on death - Set data 1 1 on Spirit Hunter"),
(21332, 0, 0, 1, 54, 0, 100, 0, 0, 0, 0, 0, 29, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Spirit hunter - on just summoned - follow player"),
(21332, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 21, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Spirit hunter - on just summoned - allow combat movement"),
(21332, 0, 2, 3, 75, 0, 100, 1, 74704, 0, 5, 1000, 12, 20427, 7, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,"Spirit Hunter - near Veneratus Spawn Node - spawn Veneratus"),
(21332, 0, 3, 4, 38, 0, 100, 0, 1, 1,0, 0, 1, 2000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Spirit Hunter - on data set 1 1 - say line 0"),
(21332, 0, 4, 5, 61, 0, 100, 0, 0, 0, 0, 0, 1, 1, 2000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Spirit Hunter - on data set 1 1 - say line 1"),
(21332, 0, 5, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 2000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Spirit Hunter - on data set 1 1 - despawn"); 

DELETE FROM `creature_text` WHERE `entry` = 21332;
INSERT INTO `creature_text` VALUES
(21332, 0, 0, "It is dying! The second part of the Cipher of Damnation is ours. I...", 12, 0, 100, 0, 0, 0, 0, "Spirit Hunter"),
(21332, 1, 0, "I am fading...Return to Ar'tor...information_schema Ret... rn... to...", 12, 0, 100, 0, 0, 0, 0, "Spirit Hunter");