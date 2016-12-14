UPDATE `creature_template` SET `AIName` = "SmartAI" WHERE `entry` = 6231;

DELETE FROM `creature_text` WHERE `entry` = 6231;
INSERT INTO `creature_text` VALUES (6231, 0, 0, 'There is no COW level!... really! I repeat: there is no COW level. Well, maby there is...', 12, 0, 100, 0, 0, 0, 0, 'Techbot');
INSERT INTO `creature_text` VALUES (6231, 0, 1, 'You are welcome, have a nice day.', 12, 0, 100, 0, 0, 0, 0, 'Techbot');
INSERT INTO `creature_text` VALUES (6231, 0, 2, 'Please be patient, we will call your name when it is your turn. We are helping people in the order they appear to us on the screen.', 12, 0, 100, 0, 0, 0, 0, 'Techbot');
INSERT INTO `creature_text` VALUES (6231, 0, 3, 'People think I like corndogs, but actually, they give me indigestion !!!', 12, 0, 100, 0, 0, 0, 0, 'Techbot');
INSERT INTO `creature_text` VALUES (6231, 0, 4, 'Techbot is sensitive and those words hurt my ears. :[ Please be nice to me. I just want to help.', 12, 0, 100, 0, 0, 0, 0, 'Techbot');
INSERT INTO `creature_text` VALUES (6231, 0, 5, 'I am a BOT. I have tons of information. To find out what I know whisper me.', 12, 0, 100, 0, 0, 0, 0, 'Techbot');
INSERT INTO `creature_text` VALUES (6231, 0, 6, 'When the rep is talking to you, he will start each line with your name. If you don\'t see your name, he\'s not speaking to you.', 12, 0, 100, 0, 0, 0, 0, 'Techbot');
INSERT INTO `creature_text` VALUES (6231, 0, 7, 'Remember, if you harass the rep or spam the channel, your account may be kicked, banned or worse.', 12, 0, 100, 0, 0, 0, 0, 'Techbot');
INSERT INTO `creature_text` VALUES (6231, 0, 8, 'If you have been muted, or have questions about the Muting/UnMuting process, please visit...zzzzttt!!', 12, 0, 100, 0, 0, 0, 0, 'Techbot');

DELETE FROM `smart_scripts` WHERE `entryorguid` = 6231;
INSERT INTO `smart_scripts` VALUES (6231, 0, 0, 0, 1, 0, 100, 0, 1000, 5000, 30000, 60000, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Techbot - Out of Combat - Say Line 0');
INSERT INTO `smart_scripts` VALUES (6231, 0, 1, 0, 0, 0, 100, 0, 15000, 18000, 19000, 38000, 11, 10852, 0, 0, 0, 0, 0, 5, 20, 0, 0, 0, 0, 0, 0, 'Techbot - In Combat - Cast Battle Net');
INSERT INTO `smart_scripts` VALUES (6231, 0, 2, 0, 0, 0, 100, 0, 5000, 12000, 15000, 28000, 11, 10855, 0, 0, 0, 0, 0, 5, 30, 0, 0, 0, 0, 0, 0, 'Techbot - In Combat - Cast Lag');
INSERT INTO `smart_scripts` VALUES (6231, 0, 3, 0, 0, 0, 100, 0, 5000, 12000, 15000, 28000, 11, 10858, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Techbot - In Combat - Cast Summon Dupe Bug');
