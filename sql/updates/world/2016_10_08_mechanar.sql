UPDATE `creature` SET `spawntimesecs` = 86400 WHERE `guid` IN ( 83239, 83240);

DELETE FROM `areatrigger_teleport` WHERE `id` IN (4612,4614);
INSERT INTO `areatrigger_teleport` (`id`,`name`,`target_map`,`target_position_x`,`target_position_y`,`target_position_z`,`target_orientation`) VALUES
(4614,'The Mechanar',530,2869.885742,1552.755249,252.158997,0.733993);
