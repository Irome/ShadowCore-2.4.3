UPDATE `gameobject_template` SET `AIName` = "SmartGameObjectAI" WHERE `entry` = 177964;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 177964;
INSERT INTO `smart_scripts` VALUES 
(177964, 1, 0, 0, 70, 0, 100, 0, 3, 0, 0, 0, 12, 12876, 4, 30000, 0, 0, 0, 8, 0, 0, 0, -776, -73.8, -45, 2.08, 'On Just Deactivated - Summon Creature');
