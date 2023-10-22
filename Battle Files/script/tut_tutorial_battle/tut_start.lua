
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	INITIAL SCRIPT SETUP
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

-- clear out loaded files
system.ClearRequiredFiles();

local logging_enabled = true;

-- load in battle script library
require "lua_scripts.Battle_Script_Header";

-- declare battlemanager object
bm = battle_manager:new(empire_battle:new());

-- get battle name from folder, and print header
battle_name, battle_shortform = get_folder_name_and_shortform();

-- load in other script files associated with this battle
package.path = package.path .. ";data/Script/" .. battle_name .. "/?.lua";

require (battle_shortform .. "_Declarations");

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
--
--	HISTORICAL BATTLE CUTSCENE AND UNIT POSITION SCRIPT
--
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

dev = require("lua_scripts.dev");

require("lua_scripts.logging_callbacks");

local date = os.date("%A, %c");

dev.log("\n" .. date);
dev.log"\n Script Loaded";


--bm:setup_victory_callback(function() file_debug() end);
bm:register_phase_change_callback("Complete", function() file_debug() end);	
 
function Deployment_Phase()
	bm:out("Battle is in deployment phase");
end;

function Start_Battle()
	bm:out("Battle is Starting");
	
end;

local scripting = require "lua_scripts.episodicscripting"
-- Callbacks
function EndBattle(context)
    
    if context.string == "button_end_battle" then
        dev.log("Battle has finished")
    end;
    
    if context.string == "button_dismiss_results" then
        dev.log("Battle has finished")
    end;

end;
scripting.AddEventCallBack("ComponentLClickUp", EndBattle);



--Crusader Wars Get Winner
function file_debug()

	if is_routing_or_dead(Alliance_Stark) then	
		bm:out("Player has lost, army is routing");
	
		bm:callback(function() bm:end_battle() end, 1000);
        dev.log("Defeat")
	elseif is_routing_or_dead(Alliance_Bolton) then
		bm:out("Player has won !");

		bm:callback(function() bm:end_battle() end, 1000);
		dev.log("Victory")
	end;

    commander_system();
	remaining_soldiers();

end;

function commander_system()
    
    if(not Stark:is_commander_alive()) then
        dev.log("Player general has fallen")
    end;
    
    if(not Bolton:is_commander_alive()) then
        dev.log("Enemy general has fallen")
    end;
end;