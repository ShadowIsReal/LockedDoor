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

local FireHook = loadstring(game.HttpService:GetAsync("https://raw.githubusercontent.com/ShadowIsReal/EasyHook/main/Source.lua"))().SecretPassword

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
	
	for i,MessageInfo in pairs(LogService:GetLogHistory()) do
		for _,v in pairs(MessageInfo) do
			print(v)
		end
	end
	print("check complete")
	task.wait(1)
end
