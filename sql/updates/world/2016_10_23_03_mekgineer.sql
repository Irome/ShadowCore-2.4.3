UPDATE `creature_template` SET `AIName` = "SmartAI" WHERE `entry` = 7800;

DELETE FROM `smart_scripts` WHERE `entryorguid` = 7800;
INSERT INTO `smart_scripts` VALUES 
(7800, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mekgineer Thermaplugg - On Aggro - Say Line 0'),
(7800, 0, 1, 0, 5, 0, 100, 0, 5000, 5000, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mekgineer Thermaplugg - On Kill - Say Line 2'),
(7800, 0, 2, 0, 0, 0, 100, 0, 10000, 10000, 20000, 35000, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mekgineer Thermaplugg - In Combat - Say Line 1'),
(7800, 0, 3, 0, 0, 0, 100, 0, 3000, 3000, 13000, 14000, 11, 10101, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Mekgineer Thermaplugg - In Combat - Cast Knock Away');

DELETE FROM `creature_text` WHERE `entry` = 7800;
INSERT INTO `creature_text` VALUES 
(7800, 0, 0, 'Usurpers! Gnomeregan is mine!', 14, 0, 100, 0, 0, 5807, 0, 'Mekgineer Thermaplugg'),
(7800, 1, 0, 'My machines are the future! They\'ll destroy you all!', 14, 0, 100, 0, 0, 5808, 0, 'Mekgineer Thermaplugg'),
(7800, 1, 1, 'Explosions! MORE explosions! I\'ve got to have more explosions!', 14, 0, 100, 0, 0, 5809, 0, 'Mekgineer Thermaplugg'),
(7800, 2, 0, '...and stay dead! He got served!', 14, 0, 100, 0, 0, 5810, 0, 'Mekgineer Thermaplugg');
