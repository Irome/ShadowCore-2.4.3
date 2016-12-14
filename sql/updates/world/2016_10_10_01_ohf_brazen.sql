DELETE FROM `gossip_menu_option` WHERE `menu_id` = 7959;
INSERT INTO `gossip_menu_option` VALUES
(7959, 0, 0, 'I\'m ready to go to Durnholde Keep.', 1, 1, 0, 0, 0, 0, 0, '');

DELETE FROM `smart_scripts` WHERE `entryorguid` = 18725;
INSERT INTO `smart_scripts`  VALUES
(18725, 0, 0, 1, 62, 0, 100, 0, 7959, 0, 0, 0, 52, 534, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Brazen - On Gossip Select - Start Taxi'),
(18725, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Erozion - On Gossip Select - Close Gossip');
