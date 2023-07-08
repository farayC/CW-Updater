--
-- Alliance declarations
--

Alliances = bm:alliances();

Alliance_Stark = Alliances:item(1);
Alliance_Bolton = Alliances:item(2);

Stark = Alliance_Stark:armies():item(1);
Bolton = Alliance_Bolton:armies():item(1);


UNIT_player_general_unit_0 = script_unit:new(Stark, "player_general_unit_0");
UNIT_player_knights_unit_0 = script_unit:new(Stark, "player_knights_unit_0");
UNIT_player_levy_infantry_unit_0 = script_unit:new(Stark, "player_levy_infantry_unit_0");
UNIT_player_levy_infantry_unit_1 = script_unit:new(Stark, "player_levy_infantry_unit_1");
UNIT_player_levy_infantry_unit_2 = script_unit:new(Stark, "player_levy_infantry_unit_2");
UNIT_player_levy_infantry_unit_rest_0 = script_unit:new(Stark, "player_levy_infantry_unit_rest_0");
UNIT_player_levy_light_infantry_unit_0 = script_unit:new(Stark, "player_levy_light_infantry_unit_0");
UNIT_player_levy_light_infantry_unit_rest_0 = script_unit:new(Stark, "player_levy_light_infantry_unit_rest_0");
UNIT_player_levy_ranged_unit_rest_0 = script_unit:new(Stark, "player_levy_ranged_unit_rest_0");
UNIT_player_armored_footmen_unit_0 = script_unit:new(Stark, "player_armored_footmen_unit_0");
UNIT_enemy_general_unit_0 = script_unit:new(Bolton, "enemy_general_unit_0");
UNIT_enemy_knights_unit_0 = script_unit:new(Bolton, "enemy_knights_unit_0");
UNIT_enemy_levy_infantry_unit_0 = script_unit:new(Bolton, "enemy_levy_infantry_unit_0");
UNIT_enemy_levy_infantry_unit_1 = script_unit:new(Bolton, "enemy_levy_infantry_unit_1");
UNIT_enemy_levy_infantry_unit_rest_0 = script_unit:new(Bolton, "enemy_levy_infantry_unit_rest_0");
UNIT_enemy_levy_light_infantry_unit_rest_0 = script_unit:new(Bolton, "enemy_levy_light_infantry_unit_rest_0");
UNIT_enemy_levy_ranged_unit_rest_0 = script_unit:new(Bolton, "enemy_levy_ranged_unit_rest_0");
UNIT_enemy_bowmen_unit_0 = script_unit:new(Bolton, "enemy_bowmen_unit_0");
UNIT_enemy_camel_riders_unit_0 = script_unit:new(Bolton, "enemy_camel_riders_unit_0");
UNIT_enemy_camel_riders_unit_rest_0 = script_unit:new(Bolton, "enemy_camel_riders_unit_rest_0");

UNIT_All = {
	UNIT_player_general_unit_0,

	UNIT_player_knights_unit_0,

	UNIT_player_levy_infantry_unit_0,

	UNIT_player_levy_infantry_unit_1,

	UNIT_player_levy_infantry_unit_2,

	UNIT_player_levy_infantry_unit_rest_0,

	UNIT_player_levy_light_infantry_unit_0,

	UNIT_player_levy_light_infantry_unit_rest_0,

	UNIT_player_levy_ranged_unit_rest_0,

	UNIT_player_armored_footmen_unit_0,

	UNIT_enemy_general_unit_0,

	UNIT_enemy_knights_unit_0,

	UNIT_enemy_levy_infantry_unit_0,

	UNIT_enemy_levy_infantry_unit_1,

	UNIT_enemy_levy_infantry_unit_rest_0,

	UNIT_enemy_levy_light_infantry_unit_rest_0,

	UNIT_enemy_levy_ranged_unit_rest_0,

	UNIT_enemy_bowmen_unit_0,

	UNIT_enemy_camel_riders_unit_0,

	UNIT_enemy_camel_riders_unit_rest_0

}