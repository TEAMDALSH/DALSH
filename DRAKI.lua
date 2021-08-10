__]] 
                              DRAKI @AUJLJI         
   _    _        _    _    _    DRAKI @IIIHIIIII 
  |.    _|| |    / \  | | _| __|   DRAKI @DRAKIALI_BOT    
    |_||_/_| |_/_/   \_\_|\_\_| 
              CH > @TeAm_DALSH
__]]             
serpent = require('serpent')
serp = require 'serpent'.block
http = require("socket.http")
config2 = dofile('libs/serpant.lua') 
https = require("ssl.https")
http.TIMEOUT = 10
lgi = require ('lgi')
TSHAKE=dofile('utils.lua')
json=dofile('json.lua')
JSON = (loadfile  "./libs/dkjson.lua")()
redis = (loadfile "./libs/JSON.lua")()
redis = (loadfile "./libs/redis.lua")()
database = Redis.connect('127.0.0.1', 6379)
notify = lgi.require('Notify')
tdcli = dofile('tdcli.lua')
notify.init ("Telegram updates")
sudos = dofile('sudo.lua')
chats = {}
day = 86400

  -----------------------------------------------------------------------------------------------
                                     -- start functions --
  -----------------------------------------------------------------------------------------------
function is_sudo(msg)
  local var = false
  for k,v in pairs(sudo_users) do
  if msg.sender_user_id_ == v then
  var = true
  end
end
  local keko_add_sudo = redis:get('sudoo'..msg.sender_user_id_..''..bot_id)
  if keko_add_sudo then
  var = true
  end
   return var
  end
-----------------------------------------------------------------------------------------------
function is_admin(user_id)
    local var = false
  local hashs =  'bot:admins:'
    local admin = database:sismember(hashs, user_id)
   if admin then
      var = true
   end
  for k,v in pairs(sudo_users) do
    if user_id == v then
      var = true
    end
  end
  local keko_add_sudo = redis:get('sudoo'..user_id..''..bot_id)
  if keko_add_sudo then
  var = true
  end
    return var
end
-----------------------------------------------------------------------------------------------
function is_vip(user_id, chat_id)
    local var = false
    local hash =  'bot:mods:'..chat_id
    local mod = database:sismember(hash, user_id)
	local hashs =  'bot:admins:'
    local admin = database:sismember(hashs, user_id)
	local hashss =  'bot:owners:'..chat_id
    local owner = database:sismember(hashss, user_id)
	local hashsss =  'bot:vipgp:'..chat_id
    local vip = database:sismember(hashsss, user_id)
	 if mod then
	    var = true
	 end
	 if owner then
	    var = true
	 end
	 if admin then
	    var = true
	 end
	 if vip then
	    var = true
	 end
    for k,v in pairs(sudo_users) do
    if user_id == v then
      var = true
    end
	end
  local keko_add_sudo = redis:get('sudoo'..user_id..''..bot_id)
  if keko_add_sudo then
  var = true
