-- Spectral Stable Hand
INSERT INTO `creature_ai_scripts` (`creature_id`, `event_type`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `comment`) VALUES (16407, 1, 3, 30000, 90000, 90000, 260000, 1, -10000, -10001, -10002, 'Spectral Stable Hand - Random Say on Iddle');


-- Spectral Stallion prenerf dmg
UPDATE `creature_template` SET `mindmg`=3750 WHERE  `entry`=15548;
UPDATE `creature_template` SET `maxdmg`=4500 WHERE  `entry`=15548;


-- Spectral Charger prenerf dmg
UPDATE `creature_template` SET `mindmg`=3750 WHERE  `entry`=15547;
UPDATE `creature_template` SET `maxdmg`=4500 WHERE  `entry`=15547;


-- Phantom Guardsman prenerf
UPDATE `creature_template` SET `resistance1`=8, `resistance2`=8, `resistance3`=8, `resistance4`=8, `resistance5`=8, `resistance6`=8 WHERE  `entry`=16425;
UPDATE `creature_template` SET `speed_walk`=1.14286, `mindmg`=3150, `maxdmg`=3750 WHERE  `entry`=16425;
UPDATE `creature_template` SET `minhealth`=71723, `maxhealth`=71723, `armor`=7089 WHERE  `entry`=16425;
UPDATE `creature_template` SET `modelid1`=16454, `modelid2`=16455, `modelid3`=16456, `modelid4`=16457 WHERE  `entry`=16425;
UPDATE `creature_template` SET `unit_flags`=0 WHERE  `entry`=16425;


-- Spectral Sentry prenerf
UPDATE `creature_template` SET `resistance1`=8, `resistance2`=8, `resistance3`=8, `resistance4`=8, `resistance5`=8, `resistance6`=8 WHERE  `entry`=16424;
UPDATE `creature_template` SET `minhealth`=71723, `maxhealth`=71723 WHERE  `entry`=16424;
UPDATE `creature_template` SET `speed_walk`=1.14286 WHERE  `entry`=16424;
UPDATE `creature_template` SET `modelid1`=16458, `modelid2`=16459, `modelid3`=16460, `modelid4`=16461 WHERE  `entry`=16425;
UPDATE `creature_template` SET `maxdmg`=3750 WHERE  `entry`=16424;
UPDATE `creature_template` SET `mindmg`=3150 WHERE  `entry`=16424;
UPDATE `creature` SET `modelid`=0 WHERE  `guid`=1300298;
UPDATE `creature` SET `modelid`=0 WHERE  `guid`=1294751;
UPDATE `creature` SET `modelid`=0 WHERE  `guid`=1300308;
UPDATE `creature` SET `modelid`=0 WHERE  `guid`=1294733;
UPDATE `creature` SET `modelid`=0 WHERE  `guid`=1294731;
UPDATE `creature` SET `modelid`=0 WHERE  `guid`=1294723;


-- 1h respwawn time for Phantom Guardsman and Spectral Sentry
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=1294739;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=1294741;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=1294737;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=1294727;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=1294723;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=1294729;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=1294731;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=1294733;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=1294735;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=1294715;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=1300300;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=1294711;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=1300308;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=1294701;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=1300306;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=1300302;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=1294695;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=1294697;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=1294743;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=1294745;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=1294747;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=1294749;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=1294751;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=1300298;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=1300296;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=1294753;


--link Phantom Guardsman and Spectral Sentry respawn with moroes
INSERT INTO `world.creature_linked_respawn` (`guid`, `linkedGuid`) VALUES
(1294739,81435),
(1294741,81435),
(1294737,81435),
(1294727,81435),
(1294723,81435),
(1294729,81435),
(1294731,81435),
(1294733,81435),
(1294735,81435),
(1294715,81435),
(1300300,81435),
(1294711,81435),
(1300308,81435),
(1294701,81435),
(1300306,81435),
(1300302,81435),
(1294695,81435),
(1294697,81435),
(1294743,81435),
(1294745,81435),
(1294747,81435),
(1294749,81435),
(1294751,81435),
(1294753,81435),
(1300296,81435),
(1300298,81435);


-- Spectral Chef prenerf
UPDATE `creature_template` SET `equipment_id`=365 WHERE  `entry`=16411;
UPDATE `creature_template` SET `modelid2`=16525, `modelid3`=16526, `modelid4`=16527 WHERE  `entry`=16411;
UPDATE `creature_template` SET `resistance1`=8, `resistance2`=8, `resistance3`=8, `resistance4`=8, `resistance5`=8, `resistance6`=8 WHERE  `entry`=16411;
UPDATE `creature_template` SET `minhealth`=71810, `maxhealth`=71810 WHERE  `entry`=16411;
UPDATE `creature_template` SET `mindmg`=4300, `maxdmg`=5000 WHERE  `entry`=16411;
UPDATE `creature_template` SET `speed_walk`=1.14286 WHERE  `entry`=16411;
UPDATE `creature_ai_scripts` SET `event_param3`=6000, `event_param4`=10000 WHERE  `id`=1641102;
UPDATE `creature_ai_scripts` SET `action2_type`=32 WHERE  `id`=1641102;
UPDATE `creature_ai_scripts` SET `event_type`=9 WHERE  `id`=1641101;
UPDATE `creature_ai_scripts` SET `event_param1`=0, `event_param2`=5 WHERE  `id`=1641101;
UPDATE `creature_ai_scripts` SET `event_param3`=4000, `event_param4`=8000 WHERE  `id`=1641102;
UPDATE `creature_ai_scripts` SET `event_param4`=8000 WHERE  `id`=1641101;
UPDATE `creature_ai_scripts` SET `event_param3`=2000, `event_param4`=5000 WHERE  `id`=1641102;
UPDATE `creature_ai_scripts` SET `action1_param3`=32, `action2_type`=0 WHERE  `id`=1641102;
UPDATE `creature_ai_scripts` SET `event_param3`=8000, `event_param4`=10000 WHERE  `id`=1641101;


-- Ghostly Baker prenerf
UPDATE `creature_template` SET `equipment_id`=555 WHERE  `entry`=16412;
UPDATE `creature_template` SET `modelid2`=16530, `modelid3`=16531, `modelid4`=16532 WHERE  `entry`=16412;
UPDATE `creature_template` SET `minhealth`=73333, `maxhealth`=73333 WHERE  `entry`=16412;
UPDATE `creature_template` SET `speed_walk`=1.14286, `baseattacktime`=2000 WHERE  `entry`=16412;
UPDATE `creature_template` SET `resistance1`=8, `resistance2`=8, `resistance3`=8, `resistance4`=8, `resistance5`=8, `resistance6`=8 WHERE  `entry`=16412;
UPDATE `creature_template` SET `mindmg`=4000, `maxdmg`=4600 WHERE  `entry`=16412;
UPDATE `creature_template` SET `armor`=7089 WHERE  `entry`=16412;
UPDATE `creature_ai_scripts` SET `event_param4`=10000 WHERE  `id`=1641201;
UPDATE `creature_ai_scripts` SET `event_param2`=6000, `event_param3`=2000, `event_param4`=4000 WHERE  `id`=1641202;
UPDATE `creature_ai_scripts` SET `event_param1`=2000, `event_param2`=4000 WHERE  `id`=1641202;
UPDATE `creature_ai_scripts` SET `event_param1`=4000, `event_param2`=6000, `event_param3`=4000, `event_param4`=6000 WHERE  `id`=1641202;
UPDATE `creature_ai_scripts` SET `event_param3`=6000, `event_param4`=8000 WHERE  `id`=1641201;


-- Spectral Servant prenerf
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `type`, `comment`) VALUES (-79, 'Invaders in the tower!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '16407');
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `type`, `comment`) VALUES (-80, 'What is this?', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '16407');
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `comment`) VALUES (-10013, 'As you wish.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '16407');
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `comment`) VALUES (-10015, 'The rest are fine without us.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '16407');
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `comment`) VALUES (-10016, 'They'll never know we're missing.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '16407');
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `comment`) VALUES (-10017, 'If we dawdle much longer, there'll be hell to pay!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '16407');
INSERT INTO `creature_ai_scripts` (`creature_id`, `event_type`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `comment`) VALUES (16407, 29, 3, 85132, 2, 84991, 15000, 1, -10013, 'Spectral Servant - As you wish1.');
INSERT INTO `creature_ai_scripts` (`creature_id`, `event_type`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `comment`) VALUES (16407, 29, 3, 1288291, 2, 84993, 15000, 1, -10013, 'Spectral Servant - As you wish2.');
INSERT INTO `creature_ai_scripts` (`creature_id`, `event_type`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `comment`) VALUES (16407, 29, 3, 1290205, 2, 85002, 15000, 1, -10013, 'Spectral Servant - As you wish3.');
INSERT INTO `creature_ai_scripts` (`creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (16407, 1, 0, 100, 3, 10000, 390000, 200000, 360000, 1, -10015, -10016, -10017, 0, 0, 0, 0, 0, 0, 0, 0, 'Spectral Servant - Random Say on Iddle');
INSERT INTO `creature_ai_scripts` (`creature_id`, `event_type`, `event_chance`, `event_flags`, `action1_type`, `action1_param1`, `action1_param2`, `comment`) VALUES (16407, 4, 100, 2, 1, -79, -80, 'Spectral Servant - Yell on Aggro');
UPDATE `creature_ai_scripts` SET `event_flags`=3 WHERE  `id`=1640701;
UPDATE `creature_ai_scripts` SET `event_param3`=5000, `event_param4`=6000, `action1_param2`=4 WHERE  `id`=1640701;
UPDATE `creature_ai_scripts` SET `event_type`=9, `event_param1`=0, `event_param2`=40 WHERE  `id`=1641202;
UPDATE `creature_template` SET `minhealth`=69860, `maxhealth`=69860 WHERE  `entry`=16407;
UPDATE `creature_template` SET `speed_walk`=1.14286 WHERE  `entry`=16407;
UPDATE `creature_template` SET `mindmg`=2000, `maxdmg`=3000, `baseattacktime`=2000 WHERE  `entry`=16407;


-- Phantom Valet prenerf
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `type`, `comment`) VALUES (-77, 'Excuse me, are you trying to sneak by without an invitation?', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '16408');
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `type`, `comment`) VALUES (-78, 'No, not now! Not like this!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '16408');
INSERT INTO `creature_ai_scripts` (`creature_id`, `event_type`, `event_flags`, `action1_type`, `action1_param1`, `action1_param2`, `comment`) VALUES (16407, 4, 2, 1, -76, -77, 'Phantom Valet - Yell on Aggro');
UPDATE `creature_template` SET `minhealth`=110160, `maxhealth`=110160 WHERE  `entry`=16408;
UPDATE `creature_template` SET `armor`=7389, `speed_walk`=1.14286, `baseattacktime`=2000, `resistance1`=16, `resistance2`=16, `resistance3`=16, `resistance4`=16, `resistance5`=16, `resistance6`=16 WHERE  `entry`=16408;
UPDATE `creature_template` SET `mindmg`=9000, `maxdmg`=11250, `mechanic_immune_mask`=536870912 WHERE  `entry`=16408;
UPDATE `creature_template` SET `modelid2`=16496, `modelid3`=16497, `modelid4`=16495 WHERE  `entry`=16408;
UPDATE `creature_ai_scripts` SET `event_param4`=20000 WHERE  `id`=1640802;
UPDATE `creature_ai_scripts` SET `action1_param3`=32 WHERE  `id`=1640802;
UPDATE `creature_ai_scripts` SET `action1_param2`=-77 WHERE  `id`=1640801;
UPDATE `creature_ai_scripts` SET `action1_param2`=-78 WHERE  `id`=1640803;
UPDATE `creature_ai_scripts` SET `event_chance`=100 WHERE  `id`=1640803;


-- Phantom Guest AI updates
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-10014, 'More food! More wine!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '16409');
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-10015, 'The rest are fine without us.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '16407');
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-10016, 'They'll never know we're missing.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '16407');
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-10017, 'If we dawdle much longer, there'll be hell to pay!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '16407');
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-10018, 'I've never been so happy! I wish this night would never end!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '16409');
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-10019, 'Ahh, life is good', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '16409');
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-10020, 'Where did I live before this? I used to know. At least I thought I did...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '16409');
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-10021, 'A feast fit for royality!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '16409');
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-10022, 'I'm positively stuffed; I can't eat another bite! Well, perhaps just one more...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '16409');
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-10023, 'And so then he says "I was talking to the chicken!"', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '16409');
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-10024, 'That joke kills me!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '16409');
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-10025, 'For the life of me I don't know why I'm here, but I'm having the best time!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '16409');
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-10026, 'I feel as though there's a task I have yet to complete....', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '16409');
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-10027, 'It's not my time, not yet!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '16409');
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-10028, 'You'll ruin everything!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '16409');
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-10029, 'Leave us alone! Let us be!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '16409');
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-10030, 'You do not belong here!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '16409');
INSERT INTO `creature_ai_scripts` (`creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (16409, 29, 0, 100, 3, 84991, 4, 85132, 15000, 1, -10014, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Phantom Guest - More food! More wine!');
INSERT INTO `creature_ai_scripts` (`creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (16409, 29, 0, 100, 3, 1295698, 4, 1288365, 10000, 1, -10008, -10009, -10010, 0, 0, 0, 0, 0, 0, 0, 0, 'Phantom Guest - Role play 1');
INSERT INTO `creature_ai_scripts` (`creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (16409, 29, 0, 100, 3, 1295694, 4, 1288437, 10000, 1, -10008, -10009, -10010, 0, 0, 0, 0, 0, 0, 0, 0, 'Phantom Guest - Role play 2');
INSERT INTO `creature_ai_scripts` (`creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (16409, 29, 0, 100, 3, 1295698, 4, 1288387, 10000, 1, -10008, -10009, -10010, 0, 0, 0, 0, 0, 0, 0, 0, 'Phantom Guest - Role play 3');
INSERT INTO `creature_ai_scripts` (`creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (16409, 29, 0, 100, 3, 1295690, 4, 1288421, 10000, 1, -10008, -10009, -10010, 0, 0, 0, 0, 0, 0, 0, 0, 'Phantom Guest - Role play 4');
INSERT INTO `creature_ai_scripts` (`creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (16409, 29, 0, 100, 3, 0, 4, 0, 10000, 1, -10008, -10009, -10010, 0, 0, 0, 0, 0, 0, 0, 0, 'Phantom Guest - Role play 5');
INSERT INTO `creature_ai_scripts` (`creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (16409, 29, 0, 100, 3, 84993, 4, 1288291, 15000, 1, -10014, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Phantom Guest - More food! More wine!');
INSERT INTO `creature_ai_scripts` (`creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (16409, 29, 0, 100, 3, 85002, 4, 1290205, 15000, 1, -10014, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Phantom Guest - More food! More wine!');
INSERT INTO `creature_ai_scripts` (`creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (16409, 1, 0, 33, 3, 1000, 790000, 200000, 660000, 1, -10018, -10019, -10020, 0, 0, 0, 0, 0, 0, 0, 0, 'Phantom Guest - Random Say on Iddle');
INSERT INTO `creature_ai_scripts` (`creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (16409, 1, 0, 33, 3, 1000, 790000, 200000, 660000, 1, 0, 0, 0, 1, -10021, -10022, -10023, 0, 0, 0, 0, 'Phantom Guest - Random Say on Iddle');
INSERT INTO `creature_ai_scripts` (`creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (16409, 1, 0, 33, 3, 1000, 790000, 200000, 660000, 1, 0, 0, 0, 0, 0, 0, 0, 1, -10024, -10025, -10026, 'Phantom Guest - Random Say on Iddle');
INSERT INTO `creature_ai_scripts` (`creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (16409, 4, 0, 100, 2, 0, 0, 0, 0, 1, -10029, -10030, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Phantom Guest - Yell on Aggro');
UPDATE `creature_ai_scripts` SET `event_param3`=0, `event_param4`=0 WHERE  `id`=1640926;
UPDATE `creature_ai_scripts` SET `event_flags`=2 WHERE  `id`=1640926;
UPDATE `creature` SET `equipment_id`=460 WHERE id like 16409

-- Ghostly Steward
UPDATE `creature_template` SET `flags_extra`=65536 WHERE  `entry`=16414;
UPDATE `creature_template` SET `modelid2`=16536, `modelid3`=16537, `modelid4`=16538 WHERE  `entry`=16414;
UPDATE `creature_template` SET `equipment_id`=48 WHERE  `entry`=16414;
UPDATE `creature_template` SET `minhealth`=96063, `maxhealth`=96063 WHERE  `entry`=16414;
UPDATE `creature_template` SET `armor`=7089 WHERE  `entry`=16414;
UPDATE `creature_template` SET `speed_walk`=1.14286 WHERE  `entry`=16414;
UPDATE `creature_template` SET `baseattacktime`=2000 WHERE  `entry`=16414;
UPDATE `creature_template` SET `resistance1`=8, `resistance2`=8, `resistance3`=8, `resistance4`=8, `resistance5`=8, `resistance6`=8 WHERE  `entry`=16414;
UPDATE `creature_template` SET `mindmg`=6000, `maxdmg`=9000, `mechanic_immune_mask`=536870912 WHERE  `entry`=16414;
UPDATE `creature_ai_scripts` SET `comment`='Ghostly Steward - Cast Frenzy and Yell at 50% HP' WHERE  `id`=1641401;
UPDATE `creature_ai_scripts` SET `event_param1`=50 WHERE  `id`=1641401;
UPDATE `creature_ai_scripts` SET `action3_type`=0, `action3_param1`=0 WHERE  `id`=1641401;
UPDATE `creature_ai_scripts` SET `event_param3`=60000, `event_param4`=60000 WHERE  `id`=1641401;
UPDATE `creature_ai_scripts` SET `event_param3`=40000 WHERE  `id`=1641401;
UPDATE `creature_ai_scripts` SET `comment`='Ghostly Steward - Cast Drunken Skull Crack' WHERE  `id`=1641402;
UPDATE `creature_ai_scripts` SET `event_inverse_phase_mask`=0 WHERE  `id`=1641402;
UPDATE `creature_ai_scripts` SET `event_param2`=10000 WHERE  `id`=1641402;
UPDATE `creature_ai_scripts` SET `event_param3`=10000 WHERE  `id`=1641402;


-- Phantom Attendant
UPDATE `creature_template` SET `flags_extra`=65536 WHERE  `entry`=16406; 
UPDATE `creature_template` SET `resistance1`=8, `resistance2`=8, `resistance3`=8, `resistance4`=8, `resistance5`=8, `resistance6`=8 WHERE  `entry`=16406;
UPDATE `creature_template` SET `minhealth`=57730, `maxhealth`=57730 WHERE  `entry`=16406;
UPDATE `creature_template` SET `speed_walk`=1.14286 WHERE  `entry`=16406;
UPDATE `creature_template` SET `modelid2`=16515 WHERE  `entry`=16406;
UPDATE `creature_template` SET `modelid3`=16516, `modelid4`=16517 WHERE  `entry`=16406;
UPDATE `creature_template` SET `baseattacktime`=2000 WHERE  `entry`=16406;
UPDATE `creature_template` SET `mindmg`=3150, `maxdmg`=3750 WHERE  `entry`=16406;
UPDATE `creature_ai_scripts` SET `event_chance`=100 WHERE  `id`=1640604;
UPDATE `creature_ai_scripts` SET `event_param3`=6000, `event_param4`=8000 WHERE  `id`=1640603;
UPDATE `creature_ai_scripts` SET `event_param1`=1000, `event_param2`=2000, `event_param3`=5000, `event_param4`=6000, `action1_param2`=7, `event_type`=0  WHERE  `id`=1640602;



-- Spectral Retainer
INSERT INTO `creature_equip_template_raw` (`equipmodel1`, `equipmodel2`, `equipinfo1`, `equipinfo2`, `equipslot1`, `equipslot2`) VALUES (34109, 18698, 50267138, 33490436, 781, 1038);
UPDATE `creature_template` SET `baseattacktime`=2000, `resistance1`=16, `resistance2`=16, `resistance3`=16, `resistance4`=16, `resistance5`=16, `resistance6`=16 WHERE  `entry`=16410;
UPDATE `creature_template` SET `speed_walk`=1.14286 WHERE  `entry`=16410;
UPDATE `creature_template` SET `modelid2`=16509, `modelid4`=16509 WHERE  `entry`=16410;
UPDATE `creature_template` SET `modelid2`=16510, `modelid3`=16511, `modelid4`=16512 WHERE  `entry`=16410;
UPDATE `creature_template` SET `minhealth`=98400, `maxhealth`=98400 WHERE  `entry`=16410;
UPDATE `creature_template` SET `mindmg`=6000, `maxdmg`=7500 WHERE  `entry`=16410;
UPDATE `creature_template` SET `flags_extra`=256 WHERE  `entry`=16410;
UPDATE `creature_template` SET `mechanic_immune_mask`=652947323 WHERE  `entry`=16410;
UPDATE `creature_template` SET `equipment_id`=4003 WHERE  `entry`=16410;
UPDATE `creature_equip_template_raw` SET `entry`=4003 WHERE  `entry`=0;
UPDATE `creature_equip_template_raw` SET `equipmodel2`=0, `equipinfo1`=0, `equipinfo2`= 33490690 WHERE  `entry`=4003;
UPDATE `creature_equip_template_raw` SET `equipslot2`=0 WHERE  `entry`=4003;
UPDATE `creature_equip_template_raw` SET `equipmodel1`=1547 WHERE  `entry`=4003;
UPDATE `creature_equip_template_raw` SET `equipmodel1`=1546 WHERE  `entry`=4003;
UPDATE `creature_equip_template_raw` SET `equipinfo1`=33490690, `equipinfo2`=0 WHERE  `entry`=4003;
UPDATE `creature_ai_scripts` SET `event_param3`=15000, `event_param4`=16000 WHERE  `id`=1641002;
UPDATE `creature_ai_scripts` SET `event_param1`=1000, `event_param2`=2000 WHERE  `id`=1641002;
UPDATE `creature_ai_scripts` SET `action1_param2`=4 WHERE  `id`=1641002;
UPDATE `creature_ai_scripts` SET `event_param3`=2000, `event_param4`=5000 WHERE  `id`=1641001;


-- Skeletal Waiter
UPDATE `creature_template` SET `resistance1`=8, `resistance2`=8, `resistance3`=8, `resistance4`=8, `resistance5`=8, `resistance6`=08 WHERE  `entry`=16415;
UPDATE `creature_template` SET `minhealth`=71810, `maxhealth`=71810 WHERE  `entry`=16415;
UPDATE `creature_template` SET `speed_walk`=1.14286 WHERE  `entry`=16415;
UPDATE `creature_template` SET `mindmg`=3750, `maxdmg`=5250 WHERE  `entry`=16415;
UPDATE `creature_ai_scripts` SET `event_param2`=8000 WHERE  `id`=1641501;
UPDATE `creature_ai_scripts` SET `action1_param2`=1 WHERE  `id`=1641501;
UPDATE `creature_ai_scripts` SET `event_param3`=8000, `event_param4`=10000 WHERE  `id`=1641501;
UPDATE `creature_ai_scripts` SET `event_param2`=18000, `event_param3`=28000 WHERE  `id`=1641501;
UPDATE `creature_ai_scripts` SET `event_param2`=8000, `event_param3`=8000 WHERE  `id`=1641501;


-- 1h respawn time for Moroes trash mobs
UPDATE `creature` SET `spawntimesecs`=3600 WHERE id like 16409 or id like 16407 or id like 16415 or id like 16414  or id like 16406 or id like 16410 or id like 16408 or id like 16411 or id like 16412

-- link trash mobs with moroes respawn time
INSERT INTO `world.creature_linked_respawn` (`guid`, `linkedGuid`) VALUES
(1296602,81435),
(85164,81435),
(85165,81435),
(1294755,81435),
(1294757,81435),
(1294777,81435),
(1294779,81435),
(1296606,81435),
(81433,81435),
(81434,81435),
(1295698,81435),
(1295684,81435),
(1295686,81435),
(1295688,81435),
(1295690,81435),
(1295694,81435),
(84991,81435),
(84992,81435),
(84993,81435),
(85048,81435),
(1293799,81435),
(1293797,81435),
(1287370,81435),
(1287378,81435),
(1294781,81435),
(1296610,81435),
(85089,81435),
(85090,81435),
(85091,81435),
(85093,81435),
(1288333,81435),
(1288283,81435),
(1288277,81435),
(1288271,81435),
(1288273,81435),
(1288279,81435),
(1288335,81435),
(85112,81435),
(85113,81435),
(1288311,81435),
(1288331,81435),
(1288289,81435),
(1288285,81435),
(85123,81435),
(85126,81435),
(1288269,81435),
(1288275,81435),
(85131,81435),
(85132,81435),
(1301214,81435),
(85134,81435),
(1288407,81435),
(1288409,81435),
(1288411,81435),
(1288413,81435),
(1288419,81435),
(1288417,81435),
(1288421,81435),
(1288371,81435),
(1288373,81435),
(1288375,81435),
(1288377,81435),
(1288379,81435),
(1288381,81435),
(1288383,81435),
(1288361,81435),
(1288363,81435),
(1288365,81435),
(1288367,81435),
(1288369,81435),
(1288385,81435),
(1288437,81435),
(1288391,81435),
(1288389,81435),
(1288387,81435),
(1288287,81435),
(85177,81435),
(1288291,81435),
(1288293,81435),
(1288313,81435),
(1288329,81435),
(1288319,81435),
(1288325,81435),
(1288327,81435),
(1288337,81435),
(1288357,81435),
(1288341,81435),
(1288343,81435),
(1288359,81435),
(1288355,81435),
(1288351,81435),
(1288353,81435),
(91288393,81435),
(1288395,81435),
(1288397,81435),
(1288399,81435),
(1288401,81435),
(1288403,81435),
(1288405,81435),
(1288423,81435),
(1288425,81435),
(1288427,81435),
(1288429,81435),
(1288431,81435),
(1288433,81435),
(1288435,81435),
(1288439,81435),
(1288441,81435),
(1288443,81435),
(1291138,81435),
(1291136,81435),
(1291132,81435),
(1291142,81435),
(1291134,81435),
(85092,81435),
(1288295,81435),
(1288297,81435),
(1288261,81435),
(1288263,81435),
(1288265,81435),
(1288267,81435),
(85118,81435),
(85124,81435),
(85125,81435),
(1296602,81435),
(1296608,81435),
(85164,81435),
(85165,81435),
(85192,81435),
(1290217,81435),
(1290221,81435),
(1290223,81435),
(1290225,81435),
(1290227,81435),
(1288299,81435),
(1288301,81435),
(1288305,81435),
(1294755,81435),
(1294757,81435),
(1294759,81435),
(1294761,81435),
(1294763,81435),
(1294765,81435),
(1294767,81435),
(1294769,81435),
(1294771,81435),
(1294773,81435),
(1294775,81435),
(1294777,81435),
(1294779,81435),
(1294783,81435),
(1296606,81435);


-- Flags fix
UPDATE `creature_template` SET `flags_extra`=256 WHERE  `entry`=16406;
UPDATE `creature_template` SET `flags_extra`=256 WHERE  `entry`=16414;
UPDATE `creature_template` SET `flags_extra`=257 WHERE  `entry`=16151;
UPDATE `creature_template` SET `flags_extra`=257 WHERE  `entry`=15550;
UPDATE `creature_template` SET `flags_extra`=257 WHERE  `entry`=16152;
UPDATE `creature_template` SET `flags_extra`=257 WHERE  `entry`=16457;
UPDATE `creature_template` SET `flags_extra`=257 WHERE  `entry`=15687;
UPDATE `creature_template` SET `flags_extra`=257 WHERE  `entry`=16471;
UPDATE `creature_template` SET `flags_extra`=256 WHERE  `entry`=16471;
DELETE FROM `creature_ai_scripts` WHERE  `id`=1640601;






