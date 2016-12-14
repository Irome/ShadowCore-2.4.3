-- Phantom Guest fix pack
DELETE FROM `creature_ai_scripts` WHERE `id` = "100000";
DELETE FROM `creature_linked_respawn` WHERE `guid` = "1294759";
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_flags`, `event_param2`, `action1_type`, `action1_param1`, `action1_param2`, `action2_type`, `action2_param1`, `comment`) VALUES (100000, 16409, 9, 991, 3, 5, 21, 1, 1, 20, 1, 'Phantom Guest - Melee when Throw Dead Zone');
UPDATE `creature_ai_scripts` SET `event_inverse_phase_mask`=575 WHERE  `id`=1640922;
UPDATE `creature_ai_scripts` SET `event_param3`=0, `event_param4`=0 WHERE  `id`=1640922;
UPDATE `creature_ai_scripts` SET `action1_param3`=32 WHERE  `id`=1640926;
UPDATE `creature_ai_scripts` SET `event_param3`=4600, `event_param4`=6000 WHERE  `id`=1640924;
UPDATE `creature` SET `id`=16409 WHERE  `guid`=85092;
UPDATE `creature` SET `id`=16409 WHERE  `guid`=85124;

-- Spectral Cheff + Ghostly Baker link with Morores respawn
INSERT INTO `creature_linked_respawn` (`guid`, `linkedGuid`) VALUES 
(1294759,81435),
(1294761,81435),
(1294763,81435),
(1294765,81435),
(1294767,81435),
(1294769,81435),
(1294771,81435),
(1294773,81435),
(1294775,81435);

-- Link Servants in stable with Midnight repsawn
UPDATE `creature_linked_respawn` SET `linkedGuid`=81432 WHERE  `guid`=1293799;
UPDATE `creature_linked_respawn` SET `linkedGuid`=81432 WHERE  `guid`=1293797;
UPDATE `creature_linked_respawn` SET `linkedGuid`=81432 WHERE  `guid`=1287370;
UPDATE `creature_linked_respawn` SET `linkedGuid`=81432 WHERE  `guid`=1287378;

-- Fix Bleeding Hollow Archer - Random Say on Aggro
UPDATE `creature_ai_scripts` SET `event_type`=4, `event_chance`=50, `event_param1`=0 WHERE  `id`=1727002;

-- Spectral Sentry Texts
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `comment`) VALUES 
(-10034, 'Stop them!', '16424'),
(-10033, 'I have failed....', '16424'),
(-10031, 'I think she winked at me.', '16424'),
(-10032, 'It\'s a great assignment, yeah, but "all looking and no touching" gets old after a while.', '16424');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `comment`) VALUES (100001, 16424, 29, 0, 3, 57068, 5, 8006402, 15000, 1, -10031, 'Spectral Sentry - Concubine roleplay');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `comment`) VALUES (100002, 16424, 29, 0, 3, 57050, 5, 8006400, 15000, 1, -10032, 'Spectral Sentry - Concubine roleplay');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `comment`) VALUES (100003, 16424, 4, 1, -79, -80, -10034, 'Spectral Sentry - Aggro Text');
UPDATE `creature_template_addon` SET `auras`='18950 0 18950 1' WHERE  `entry`=16424;
UPDATE `creature_ai_texts` SET `type`=0 WHERE `entry`=-80;
UPDATE `creature_ai_scripts` SET `event_flags`='2', `event_param1`=0, `event_param2`=0, `event_param3`=0, `event_param4`=0, `action2_type`='11', `action2_param1`='29651' WHERE  `id`=1642401;
UPDATE `creature_ai_scripts` SET `event_chance`=100, `action1_param3`=-10033 WHERE  `id`=1642408;
UPDATE `creature_ai_scripts` SET `event_chance`='100', `event_param1`='5' WHERE  `id`=1642406;
UPDATE `creature_ai_scripts` SET `event_type`='9', `event_param1`='5', `event_param2`='30', `event_param3`='11000' WHERE  `id`=1642403;

-- Phantom Guardsman Texts
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `type`, `comment`) VALUES 
(-10035, 'To arms!', 1, '16425'),
(-10036, 'Protect the tower!', 1, '16425'),
(-10037, 'Have at them!', 1, '16425');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `comment`) VALUES (100004, 16425, 4, 1, -10037, -10036, -10035, 'Phantom Guardsman - Aggro Text');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `comment`) VALUES (100005, 16425, 6, 100, 2, 1, -10033, -54, -55, 'Phantom Guardsman - Death Text');

-- Spectral Servant fixs
UPDATE `creature_template` SET `unit_flags`=32832 WHERE  `entry`=16424;
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `type`, `comment`) VALUES 
(-10038, 'Without delay!', 1, '16407');
UPDATE `creature_ai_scripts` SET `action1_param3`=-10034 WHERE  `id`=19228161;
UPDATE `creature_ai_scripts` SET `action1_param2`=-10038 WHERE  `id`=19228166;
UPDATE `creature_ai_scripts` SET `action1_param2`=-10038 WHERE  `id`=19228164;
UPDATE `creature_ai_scripts` SET `action1_param2`=-10038 WHERE  `id`=19228162;

-- Spectral Apprentice Text
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `type`, `comment`) VALUES 
(-10039, 'You, hold there!', 1, '16389'),
(-10040, 'I am lost...', 0, '16389'),
(-10041, 'Why...?', 0, '16389');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `action1_type`, `action1_param1`, `action1_param2`, `comment`) VALUES (100006, 16389, 6, 100, 2, 1, -10040, -10041, 'Spectral Apprentice - Death Text');
UPDATE `creature_ai_scripts` SET `action2_type`=1, `action2_param1`=-10039, `action2_param2`=-10003 WHERE  `id`=1638901;

-- Ghostly Steward Text
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `type`, `comment`) VALUES 
(-10042, 'Impudent outsiders!', 1, '16414'),
(-10043, 'Meddling fools! You will pay with your lives!', 1, '16414'),
(-10044, 'You\'ll never make it out alive....', 0, '16414');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `comment`) VALUES (100007, 16414, 4, 1, -350, -10042, -10043, 'Ghostly Steward - Aggro Text');
UPDATE `creature_ai_scripts` SET `event_chance`=100, `action1_param2`=-10044 WHERE  `id`=1641403;

-- Spectral Chef Text 
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `type`, `comment`) VALUES 
(-10045, 'I\'ll gut you like a fish!', 1, '16411'),
(-10046, 'I\'ll carve the meat from your bones!', 1, '16411'),
(-10047, 'I\'ll chop you into minced meat!', 1, '16411'),
(-10048, 'I have served to the last....', 0, '16411'),
(-10049, 'I tried, master. I tried.', 0, '16411'),
(-10050, 'This isn\'t the end; it can\'t be!', 1, '16411');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `comment`) VALUES (100008, 16411, 4, 1, -10045, -10046, -10047, 'Spectral Chef - Aggro Text');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `comment`) VALUES (100009, 16411, 6, 100, 2, 1, -10048, -10049, -10050, 'Spectral Chef - Death Text');

-- Ghostly Baker Text
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `comment`) VALUES (100010, 16412, 4, 1, -10045, -10046, -10047, 'Ghostly Baker - Aggro Text');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `comment`) VALUES (100011, 16412, 6, 100, 2, 1, -10048, -10049, -10050, 'Ghostly Baker - Death Text');

-- Skeletal Waiter Text
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `type`, `comment`) VALUES 
(-10051, 'No sooner said than done, sir.', 0, '16415');
UPDATE `creature_ai_scripts` SET `action1_param3`=-10051 WHERE  `id`=19228146;
UPDATE `creature_ai_scripts` SET `action1_param2`=-10051 WHERE  `id`=19228147;
UPDATE `creature_ai_scripts` SET `action1_param1`=-10051 WHERE  `id`=19228145;

-- Phantom Valet Text
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `type`, `comment`) VALUES 
(-10052, 'Begone, outsider!', 1, '16408'),
(-10053, 'We are besieged!', 1, '16408'),
(-10054, 'You\'ll not ruin the celebration!', 1, '16408'),
(-10055, 'My time is done.', 0, '16408');
UPDATE `creature_ai_scripts` SET `action1_param1`=-10052, `action1_param2`=-10053, `action1_param3`=-10054 WHERE  `id`=1640801;
UPDATE `creature_ai_scripts` SET `action1_param3`=-10055 WHERE  `id`=1640803;
INSERT INTO `creature_template_addon` (`entry`, `auras`) VALUES (16408, '18950 0 18950 1');

-- Phantom Attendant Text
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `type`, `comment`) VALUES 
(-10056, 'I mustn\'t be afraid....', 0, '16406'),
(-10057, 'We do not wish to be disturbed!', 1, '16406');
UPDATE `creature_ai_scripts` SET `action1_param3`='-10054' WHERE  `id`=1640604;
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `comment`) VALUES (100013, 16406, 4, 1, -10057, -936, -10028, 'Phantom Attendant - Aggro Text');

-- Spectral Retainer Text
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `action1_type`, `action1_param1`, `action1_param2`, `comment`) VALUES (100014, 16410, 4, 1, -10028, -936, 'Spectral Retainer - Aggro Text');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `comment`) VALUES (100015, 16410, 6, 100, 2, 1, -10056, -53, -52, 'Spectral Retainer - Death Text');

-- 2x Sentry patroling
INSERT INTO creature VALUES (8006400,16424,532,1,0,710,-10875.3,-1957.63,92.1658,4.66468,25,0,0,71723,0,0);
INSERT INTO creature VALUES (8006402,16424,532,1,0,710,-10880.5,-1957.1,92.1678,4.64896,25,0,0,71723,0,0);
INSERT INTO creature_addon (guid,path_id, bytes2) VALUES ('8006402','8006402','4097');
INSERT INTO creature_addon (guid,bytes2) VALUES ('8006400','4097');
UPDATE creature_addon SET path_id = '8006402' WHERE guid = '8006402';
UPDATE creature SET MovementType = '2' WHERE guid = '8006402';
INSERT INTO waypoint_data (id,point,position_x,position_y,position_z,orientation) VALUES ('8006402','1','-10882.356445','-1975.520386','92.171455','4.546851');
INSERT INTO waypoint_data (id,point,position_x,position_y,position_z,orientation) VALUES ('8006402','2','-10886.086914','-1994.996460','92.172455','4.473024');
INSERT INTO waypoint_data (id,point,position_x,position_y,position_z,orientation) VALUES ('8006402','3','-10893.943359','-2017.420288','92.173470','4.416475');
INSERT INTO waypoint_data (id,point,position_x,position_y,position_z,orientation) VALUES ('8006402','4','-10902.704102','-2040.135132','92.173470','4.251544');
INSERT INTO waypoint_data (id,point,position_x,position_y,position_z,orientation) VALUES ('8006402','5','-10916.513672','-2064.565674','92.173424','4.188712');
INSERT INTO waypoint_data (id,point,position_x,position_y,position_z,orientation) VALUES ('8006402','6','-10903.702148','-2050.987793','92.171883','0.921449');
INSERT INTO waypoint_data (id,point,position_x,position_y,position_z,orientation) VALUES ('8006402','7','-10891.356445','-2035.615601','92.174065','1.164921');
INSERT INTO waypoint_data (id,point,position_x,position_y,position_z,orientation) VALUES ('8006402','8','-10879.458008','-1987.015991','92.172241','1.357345');
INSERT INTO waypoint_data (id,point,position_x,position_y,position_z,orientation) VALUES ('8006402','9','-10877.362305','-1956.764038','92.165565','1.581184');
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES (8006402, 8006402, 0, 0, 2);
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES (8006402, 8006400, 2, 270, 2);

-- Cocubine 
UPDATE `creature_template` SET `modelid2`=16552, `modelid4`=16553, `minhealth`=95747, `maxhealth`=95747, `speed_walk`=1.14286, `mindmg`=3000, `maxdmg`=3900, `resistance1`=8, `resistance2`=8, `resistance3`=8, `resistance4`=8, `resistance5`=8, `resistance6`=8, `mechanic_immune_mask`=648634933 WHERE `entry`=16461;
UPDATE `creature` SET `id`=16461 WHERE `guid`=57046;
INSERT INTO `script_texts` (`entry`, `content_default`, `emote`, `comment`) VALUES (-1500000, 'Five seconds! I\'m not kidding!', 1, 'Concubine iddle say1');
INSERT INTO `script_texts` (`entry`, `content_default`, `emote`, `comment`) VALUES (-1500001, 'So I said, "Yeah, but that\'ll cast you extra."', 1, 'Concubine - iddle say2');
INSERT INTO `script_texts` (`entry`, `content_default`, `emote`, `comment`) VALUES (-1500002, 'Enough foreplay. Let\'s get down to buisness.', 1, 'Concubine - transform say');
INSERT INTO `script_texts` (`entry`, `content_default`, `emote`, `comment`) VALUES (-1500003, 'You WILL be mine.', 1, 'Concubine - Aggro 5');
INSERT INTO `script_texts` (`entry`, `content_default`, `emote`, `comment`) VALUES (-1500004, 'Just when things were getting interesting.', 1, 'Concubine - death2');
INSERT INTO `script_texts` (`entry`, `content_default`, `emote`, `comment`) VALUES (-1500005, 'Come here, pretty.You have what I need!', 1, 'Concubine - Aggro1');
INSERT INTO `script_texts` (`entry`, `content_default`, `emote`, `comment`) VALUES (-1500006, 'Come play with me!', 1, 'Concubine - Aggro2');
INSERT INTO `script_texts` (`entry`, `content_default`, `emote`, `comment`) VALUES (-1500007, 'I\'ve been very, very naughty....', 1, 'Concubine - Aggro3');
INSERT INTO `script_texts` (`entry`, `content_default`, `emote`, `comment`) VALUES (-1500008, 'Come any closer, and I\'ll scream.', 1, 'Concubine - Aggro4');
INSERT INTO `script_texts` (`entry`, `content_default`, `emote`, `comment`) VALUES (-1500009, 'Shhh... I have a little secret I\'ve been keeping. ', 1, 'Mistress - Transform');
INSERT INTO `script_texts` (`entry`, `content_default`, `emote`, `comment`) VALUES (-1500010, 'I want you to be with me... forever and ever.', 1, 'Concubine - Death3');
INSERT INTO `script_texts` (`entry`, `content_default`, `emote`, `comment`) VALUES (-1500011, '<sigh> It\'s always over too soon.', 1, 'Concubine - Death4');
INSERT INTO `script_texts` (`entry`, `content_default`, `emote`, `comment`) VALUES (-1500012, 'It was fun while it lasted....', 1, 'Concubine - Death5');
INSERT INTO `script_texts` (`entry`, `content_default`, `emote`, `comment`) VALUES (-1500013, 'I want to show you a different side of me....', 1, 'Hostess - Transform');

-- Night Mistress
UPDATE `creature_template` SET `modelid1`=16547, `modelid2`=16548,`modelid3`=16549, `modelid4`=16550, `minhealth`=95747, `maxhealth`=95747, `speed_walk`=1.14286, `mindmg`=3000, `maxdmg`=3900, `resistance1`=8, `resistance2`=8, `resistance3`=8, `resistance4`=8, `resistance5`=8, `resistance6`=8, `AIName`='', `mechanic_immune_mask`=648241717, `ScriptName`='npc_mistress' WHERE  `entry`=16460;
UPDATE `creature` SET `id`=16460 WHERE `guid`=57043;
UPDATE `creature` SET `id`=16460 WHERE `guid`=57055;
UPDATE `creature` SET `id`=16460 WHERE `guid`=57052;
UPDATE `creature` SET `position_x`=-10846, `position_y`=-2100, `position_z`=93, `orientation`=4 WHERE  `guid`=57067;

-- Wanton Hostess
UPDATE `creature_template` SET `modelid2`=16544, `modelid4`=16545, `minhealth`=95747, `maxhealth`=95747, `speed_walk`=1.14286, `mindmg`=3000, `maxdmg`=3900, `resistance1`=8, `resistance2`=8, `resistance3`=8, `resistance4`=8, `resistance5`=8, `resistance6`=8, `AIName`='', `mechanic_immune_mask`=648241717, `ScriptName`='npc_hostess' WHERE  `entry`=16459;
UPDATE `creature` SET `id`=16459 WHERE `guid`=57061;
UPDATE `creature` SET `id`=16459 WHERE `guid`=57074;
UPDATE `creature` SET `id`=16459 WHERE `guid`=57059;
INSERT INTO creature VALUES (8007305,16459,532,1,16545,0,-10851.8,-2107.16,92.1625,0.927805,25,0,0,57448,0,0);

-- Concubine + Hosstes patroling
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES (57051, 57051, 0, 0, 2);
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES (57051, 57075, 1, 270, 2);
INSERT INTO creature_addon (guid,path_id) VALUES ('57051','57051');
UPDATE creature_addon SET path_id = '57051' WHERE guid = '57051';
UPDATE creature SET MovementType = '2' WHERE guid = '57051';
INSERT INTO waypoint_data (id,point,position_x,position_y,position_z,orientation) VALUES ('57051','1','-10884.278320','-2016.553955','92.173454','2.790724');
INSERT INTO waypoint_data (id,point,position_x,position_y,position_z,orientation) VALUES ('57051','2','-10894.701172','-2033.018066','92.173561','4.216219');
INSERT INTO waypoint_data (id,point,position_x,position_y,position_z,orientation) VALUES ('57051','3','-10903.714844','-2048.415771','92.172134','4.188730');
INSERT INTO waypoint_data (id,point,position_x,position_y,position_z,orientation) VALUES ('57051','4','-10910.782227','-2060.656250','92.172134','4.188730');
INSERT INTO waypoint_data (id,point,position_x,position_y,position_z,orientation) VALUES ('57051','5','-10893.501953','-2072.467041','92.170082','5.677058');
INSERT INTO waypoint_data (id,point,position_x,position_y,position_z,orientation) VALUES ('57051','6','-10867.901367','-2090.211426','90.496796','5.677058');
INSERT INTO waypoint_data (id,point,position_x,position_y,position_z,orientation) VALUES ('57051','7','-10854.076172','-2099.795166','92.162613','5.677058');
INSERT INTO waypoint_data (id,point,position_x,position_y,position_z,orientation) VALUES ('57051','8','-10870.206055','-2088.568359','90.496460','2.582590');
INSERT INTO waypoint_data (id,point,position_x,position_y,position_z,orientation) VALUES ('57051','9','-10889.455078','-2074.785889','92.166435','2.662700');
INSERT INTO waypoint_data (id,point,position_x,position_y,position_z,orientation) VALUES ('57051','10','-10907.980469','-2063.178223','92.170845','2.568452');
INSERT INTO waypoint_data (id,point,position_x,position_y,position_z,orientation) VALUES ('57051','11','-10898.963867','-2045.619995','92.171700','1.107612');
INSERT INTO waypoint_data (id,point,position_x,position_y,position_z,orientation) VALUES ('57051','12','-10891.144531','-2029.963867','92.173531','1.107612');
INSERT INTO waypoint_data (id,point,position_x,position_y,position_z,orientation) VALUES ('57051','13','-10881.696289','-2018.030029','92.173531','5.941737');
INSERT INTO waypoint_data (id,point,position_x,position_y,position_z,orientation) VALUES ('57051','14','-10862.806641','-2024.217407','92.173531','5.941738');
INSERT INTO waypoint_data (id,point,position_x,position_y,position_z,orientation) VALUES ('57051','15','-10845.414063','-2030.397949','90.925720','5.941738');
INSERT INTO waypoint_data (id,point,position_x,position_y,position_z,orientation) VALUES ('57051','16','-10862.833008','-2023.890869','92.174995','2.780510');
INSERT INTO waypoint_data (id,point,position_x,position_y,position_z,orientation) VALUES ('57051','17','-10878.375000','-2018.338501','92.174995','2.772656');
INSERT INTO waypoint_data (id,point,position_x,position_y,position_z,orientation) VALUES ('57051','18','-10882.278320','-2007.361694','92.174995','1.543508');
INSERT INTO waypoint_data (id,point,position_x,position_y,position_z,orientation) VALUES ('57051','19','-10876.645508','-1989.477783','92.171921','1.272545');
INSERT INTO waypoint_data (id,point,position_x,position_y,position_z,orientation) VALUES ('57051','20','-10851.211914','-1992.915039','92.160889','6.106677');
INSERT INTO waypoint_data (id,point,position_x,position_y,position_z,orientation) VALUES ('57051','21','-10838.736328','-1987.479858','92.160889','1.398215');
INSERT INTO waypoint_data (id,point,position_x,position_y,position_z,orientation) VALUES ('57051','22','-10834.106445','-1960.917603','93.358849','1.398215');
INSERT INTO waypoint_data (id,point,position_x,position_y,position_z,orientation) VALUES ('57051','23','-10838.778320','-1989.671509','92.160309','4.469123');
INSERT INTO waypoint_data (id,point,position_x,position_y,position_z,orientation) VALUES ('57051','24','-10860.624023','-1991.378174','92.160309','2.984719');
INSERT INTO waypoint_data (id,point,position_x,position_y,position_z,orientation) VALUES ('57051','25','-10875.534180','-1988.871704','92.173164','4.504464');
INSERT INTO waypoint_data (id,point,position_x,position_y,position_z,orientation) VALUES ('57051','26','-10882.139648','-2007.620239','92.173943','4.402360');
INSERT INTO waypoint_data (id,point,position_x,position_y,position_z,orientation) VALUES ('57051','27','-10880.896484','-2017.716797','92.173943','5.768949');
INSERT INTO waypoint_data (id,point,position_x,position_y,position_z,orientation) VALUES ('57051','28','-10862.175781','-2023.963745','92.173943','5.910320');
INSERT INTO waypoint_data (id,point,position_x,position_y,position_z,orientation) VALUES ('57051','29','-10844.645508','-2030.241699','90.924835','5.949588');
INSERT INTO waypoint_data (id,point,position_x,position_y,position_z,orientation) VALUES ('57051','30','-10862.227539','-2024.384033','92.175499','2.796213');
INSERT INTO waypoint_data (id,point,position_x,position_y,position_z,orientation) VALUES ('57051','31','-10876.455078','-2019.265137','92.175499','2.796213');


-- Correct 1h respawn timer for Maiden's trash
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=8006400;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=8006402;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=57030;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=57031;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=57032;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=57033;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=57034;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=57035;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=57042;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=57043;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=57044;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=57045;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=57046;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=57047;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=57048;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=57049;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=57050;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=57051;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=57052;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=57053;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=57054;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=57055;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=57056;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=57057;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=57058;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=57059;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=57061;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=57062;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=57063;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=57064;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=57065;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=57066;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=57067;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=57068;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=57069;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=57070;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=57071;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=57073;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=57074;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=57075;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=57076;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=57077;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=57078;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=57079;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=57080;
UPDATE `creature` SET `spawntimesecs`=3600 WHERE  `guid`=8007305;


-- Link Maiden's trash to her respawn time
DELETE FROM `creature_linked_respawn` WHERE  `guid`=1291138;
DELETE FROM `creature_linked_respawn` WHERE  `guid`=1291136;
DELETE FROM `creature_linked_respawn` WHERE  `guid`=1291132;
DELETE FROM `creature_linked_respawn` WHERE  `guid`=1291134;
DELETE FROM `creature_linked_respawn` WHERE  `guid`=1290221;
DELETE FROM `creature_linked_respawn` WHERE  `guid`=1290223;
DELETE FROM `creature_linked_respawn` WHERE  `guid`=1290225;
DELETE FROM `creature_linked_respawn` WHERE  `guid`=1290227;
DELETE FROM `creature_linked_respawn` WHERE  `guid`=1291142;
DELETE FROM `creature_linked_respawn` WHERE  `guid`=1290217;

INSERT INTO `creature_linked_respawn` (`guid`, `linkedGuid`) VALUES
(8006400,57040),
(8006402,57040),
(57030,57040),
(57031,57040),
(57032,57040),
(57033,57040),
(57034,57040),
(57035,57040),
(57042,57040),
(57043,57040),
(57044,57040),
(57045,57040),
(57046,57040),
(57047,57040),
(57048,57040),
(57049,57040),
(57050,57040),
(57051,57040),
(57052,57040),
(57053,57040),
(57054,57040),
(57055,57040),
(57056,57040),
(57057,57040),
(57058,57040),
(57059,57040),
(57061,57040),
(57062,57040),
(57063,57040),
(57064,57040),
(57065,57040),
(57066,57040),
(57067,57040),
(57068,57040),
(57069,57040),
(57070,57040),
(57071,57040),
(57073,57040),
(57074,57040),
(57075,57040),
(57076,57040),
(57077,57040),
(57078,57040),
(57079,57040),
(57080,57040),
(1290251,57040),
(1290241,57040),
(1290243,57040),
(1290245,57040),
(1290247,57040),
(1292010,57040),
(1290249,57040),
(1290257,57040),
(85183,57040),
(85184,57040),
(85185,57040),
(1290209,57040),
(1290207,57040),
(1290205,57040),
(1290253,57040),
(1290255,57040),
(1290233,57040),
(1290235,57040),
(1290237,57040),
(1290239,57040),
(1290229,57040),
(1290231,57040),
(1290211,57040),
(1290213,57040),
(1290215,57040),
(1290259,57040),
(1292012,57040),
(1292014,57040),
(1292016,57040),
(1292018,57040),
(1292020,57040),
(1292022,57040),
(1292024,57040),
(1292026,57040),
(1292028,57040),
(1292030,57040),
(1292032,57040),
(8005397,57040),
(8005399,57040),
(85002,57040),
(85024,57040),
(1292912,57040),
(1292914,57040),
(1294689,57040),
(1294691,57040),
(1291138,57040),
(1291136,57040),
(1291132,57040),
(1291134,57040),
(1290221,57040),
(1290223,57040),
(1290225,57040),
(1290227,57040),
(1291142,57040),
(85192,57040);
(1290217,57040);


-- This 2 mobs mobs need to be deleted from Karazhan
DELETE FROM creature WHERE guid = '57060';
DELETE FROM creature_addon WHERE guid = '57060';
DELETE FROM game_event_creature WHERE guid = '57060';
DELETE FROM game_event_model_equip WHERE guid = '57060';
DELETE FROM creature WHERE guid = '57072';
DELETE FROM creature_addon WHERE guid = '57072';
DELETE FROM game_event_creature WHERE guid = '57072';
DELETE FROM game_event_model_equip WHERE guid = '57072';

-- Database cleaning from "old test stuff"
DELETE FROM `waypoint_scripts` WHERE  `id`=504;
DELETE FROM `waypoint_scripts` WHERE  `id`=505;

-- Fix say/yell texts
UPDATE `creature_ai_texts` SET `type`=1 WHERE content_default like "%!%" and type like 0;
UPDATE `creature_ai_texts` SET `type`=0 WHERE content_default not like "%!%" and type like 1;