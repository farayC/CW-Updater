-- Originally created by R2TR development team.
-- Free to be used, under the conditions that:
-- 	1. If this file has been modified, any significant changes must be stated
-- 	2. This file header is included in all derivatives

-- DETrooper Changes: Added component-based camera system logger, appended to another file. I've also deleted all of the campaign-based stuff since we're gonna be using this for HBs.

-- logging_callbacks.lua
-- Handles all the logging of event callbacks

-- General
module(..., package.seeall)
_G.main_env = getfenv(1) -- Probably not needed in most places

-- Includes
local dev = require "lua_scripts.dev"
local scripting = require "lua_scripts.episodicscripting"


-- Logging
dev.log("")
dev.log("--------------------------------------------------------")
dev.log("--------------------------------------------------------")
dev.log("--")
dev.log("--	                    CRUSADER WARS                    ")
dev.log("--")
dev.log("--------------------------------------------------------")
dev.log("--------------------------------------------------------")