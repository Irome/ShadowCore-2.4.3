DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 17976; 

INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
(1797601, 17976, 4, 0, 100, 6, 0, 0, 0, 0, 1, -34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Commander Sarannis - Yell on Aggro'),
(1797602, 17976, 9, 0, 100, 3, 0, 10, 11000, 16000, 11, 34794, 1, 0, 1, -37, 0, 0, 0, 0, 0, 0, 'Commander Sarannis (Normal) - Cast Arcane Resonance and Yell'),
(1797604, 17976, 24, 0, 100, 7, 34794, 2, 11000, 19000, 11, 34799, 1, 1, 1, -38, 0, 0, 0, 0, 0, 0, 'Commander Sarannis - Cast Arcane Devastation and Yell'),
(1797605, 17976, 0, 0, 100, 7, 60000, 60000, 60000, 60000, 1, -39, 0, 0, 12, 20078, 4, 1800000, 12, 19633, 4, 1800000, 'Commander Sarannis - Yell and Summon Bloodwarder Reservist and Bloodwarder Mender'),
(1797606, 17976, 0, 0, 100, 7, 60000, 60000, 60000, 60000, 12, 20078, 4, 1800000, 12, 20078, 4, 1800000, 0, 0, 0, 0, 'Commander Sarannis - Summon 2 Bloodwarder Reservists'),
(1797607, 17976, 5, 0, 100, 7, 5000, 5000, 0, 0, 1, -21, -35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Commander Sarannis - Yell on Player Kill'),
(1797608, 17976, 6, 0, 100, 6, 0, 0, 0, 0, 1, -36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Commander Sarannis - Yell on Death');
