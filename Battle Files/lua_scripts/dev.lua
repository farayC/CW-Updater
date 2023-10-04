-- Originally created by R2TR development team.
-- Free to be used, under the conditions that:
-- 	1. If this file has been modified, any significant changes must be stated
-- 	2. This file header is included in all derivatives

-- DETrooper Changes: Deleted a bunch of stuff like the settings, so that this can run straight out of the .pack.

-- General
module(..., package.seeall)
_G.main_env = getfenv(1) -- Probably not needed in most places

-- Includes
local util = require "lua_scripts.util"

local fileMethod = "preface"
local modName = "BattleResults"

if fileMethod == "preface" then
	modName = modName .. "_"
elseif fileMethod == "foldered" then
	os.execute("IF NOT EXIST " .. modName .. " ( mkdir " .. modName .. " )")
	modName = modName .. "\\"
end

-- Logging functions
function log(text)

	local logfile
	if not util.fileExists("data/" .. modName .. "log.txt") then
		logfile = io.open("data/" .. modName .. "log.txt", "w")
		logfile:write("Log file does not exist, created new\n")
	else
		logfile = io.open("data/" .. modName .. "log.txt", "a")
	end
	
	text = tostring(text)
	logfile:write(text .. "\n")
	logfile:close()
end
