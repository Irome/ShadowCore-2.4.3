SET @ENTRY = 19055;
UPDATE `creature_template` SET `AIName` = "SmartAI" WHERE `entry` = @ENTRY;
DELETE FROM `waypoints` WHERE `entry` = @ENTRY;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(@ENTRY, 1, -2422.51, 6910.64, 20.1247, 'Windroc Matriarch WP 1'),
(@ENTRY, 2, -2420.72, 6901.21, 15.2252, 'Windroc Matriarch WP 2'),
(@ENTRY, 3, -2400.64, 6887.52, -1.38425, 'Windroc Matriarch WP 3');

DELETE FROM `smart_scripts` WHERE `entryorguid` IN ( @ENTRY, @ENTRY * 100);
INSERT INTO `smart_scripts` VALUES
(@ENTRY, 0, 0, 1, 54, 0, 100, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, -2424.30, 6906.96, 14.13, 3.23, 'Windroc Matriarch - Move to pos 0'),
(@ENTRY, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, @ENTRY*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Windroc Matriarch - run script'),
(@ENTRY*100, 9, 0, 0, 0, 0, 100, 0, 5000, 5000, 5000, 5000, 69, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, -2405.46, 6907.07, 3.257, 4.09, 'Windroc Matriarch - Move to pos 1'),
(@ENTRY*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 19, 768, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Windroc Matriarch - Remove Unit Flags'),
(@ENTRY*100, 9, 2, 0, 0, 0, 100, 0, 5000, 5000, 5000, 5000, 49, 0, 0, 0, 0, 0, 0, 21, 20, 0, 0, 0, 0, 0, 0, 'Windroc Matriarch - start attack');  
