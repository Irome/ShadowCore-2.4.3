SET @OGUID = 100004;
SET @YOR = 22930;
SET @ENTRY = 185522;

DELETE FROM `gameobject` WHERE `guid` = @OGUID;
INSERT INTO `gameobject` VALUES
(@OGUID, @ENTRY, 557, 2, -231.43, -9.24, 16.83, 1.57, 0, 0, 0, 0, 60, 0, 1);

DELETE FROM `smart_scripts` WHERE `entryorguid` = @OGUID;
INSERT INTO `smart_scripts` VALUES
(@ENTRY, 1, 0, 0, 70, 0, 100, 0, 2, 0, 0, 0, 12,  @YOR, 3, 600000, 0, 0,0, 1, 0, 0, 0, 0, 0, 0, 0, "On state change - spawn Yor");

UPDATE `gameobject_template` SET `AIName` = "SmartGameObjectAI" WHERE `entry` = @ENTRY;
UPDATE `creature_template` SET `faction` = 16 WHERE `entry` = @YOR;
