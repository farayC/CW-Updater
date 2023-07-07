-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	HISTORIC BATTLE FRONTEND SCRIPT
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

require "lua_scripts.frontend_hb_declarations";
local dev = require "lua_scripts.dev" -- added this
local scripting = require "lua_scripts.episodicscripting" -- added this

svr:SaveBool("Adrianople_Launched_From_Prologue", false);



----------------------------------------------
--
--	Historic battle data
--
----------------------------------------------



Historic_Battle_List = {
	"Catalaunian_Plains",
	"Utus",
	"Ravenna",
	"Frigidus_River",
	"Cap_Bon",
	"Samarra",
	"Cartagena",
	"Soissons",
	"Ad_Decimum",
	"Adrianople",
	"Dara",
	"tut_tutorial_battle",
	"ba_battle_of_bastards",
	"ith_ithilien_ambush"
};


function Historic_Battle_Exists(battle)
	for i = 1, #Historic_Battle_List do
		if Historic_Battle_List[i] == battle then
			return true;
		end;
	end;
	
	return false;
end;



-- fade-out all interactive UI elements on the frontend 
-- prior to a historic battle sequence being shown
function Fade_Out_HB_UI(uic)
	UIComponent(uic:Find("battle_popup")):TriggerAnimation("fade_out");
	
	UIComponent(m_root:Find("sp_frame")):TriggerAnimation("fade_out");
		
	for i = 1, #Historic_Battle_List do
		UIComponent(uic:Find(Historic_Battle_List[i])):TriggerAnimation("fade_out");
	end;
end;


-- fades-in all interactive UI elements on the frontend after
-- to a historic battle outro sequence has been shown
function Fade_In_HB_UI(uic)
	UIComponent(uic:Find("battle_popup")):TriggerAnimation("fade_in");
	
	UIComponent(m_root:Find("sp_frame")):TriggerAnimation("fade_in");
		
	for i = 1, #Historic_Battle_List do
		UIComponent(uic:Find(Historic_Battle_List[i])):TriggerAnimation("fade_in");
	end;
end;




BOOL_Sequence_Skipped = false;

function OnHistoricBattleEvent(context)
	local str = context.string;

	print("\t\tOnHistoricBattleEvent(context) called, context.string is " .. tostring(str));
	
	uic = UIComponent(context.component);
	
	if str == "hist_cancel_sequence" then
		if BOOL_Sequence_Skipped then
			return;
		end;
		
		BOOL_Sequence_Skipped = true;
		
		-- go through the fe sequences and attempt to cancel them all
		for k, v in pairs(fesequences_intro) do
			v:skip();
		end;	
	elseif fesequences_intro[str] then
		print("Playing frontend sequence for battle: " .. tostring(str));
	
		-- fade out UI
		Fade_Out_HB_UI(uic);
		
		-- play animated sequence 1 second later
		tm:callback(
			function() 
				fesequences_intro[str]:play(uic);
				
				-- skip the sequence immediately if ESC has already been pressed by this point
				if BOOL_Sequence_Skipped then
					print("\t\tSkipping sequences as it starts");
					fesequences_intro[str]:skip();
				end;
			end, 
			1000
		);
	elseif Historic_Battle_Exists(str) then
		print("Immediately launching battle: " .. tostring(str));
		FrontEnd.start_historic_battle(str);
	end;
end;

AddEventCallBack("HistoricBattleEvent", OnHistoricBattleEvent);


