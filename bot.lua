local Discordia = require('discordia')
local Client = Discordia.Client()

function sleep(n)
	os.execute("timeout " .. tonumber(n))
end

local Games = {
	"Noob VS Zombie",
	"Zombie Town",
	"The Zombie's Onslaught",
	"NVZ Realish",
	"ZD4",
	"ZCR",
	"BTSTUB",
	"Raipei Simulator",
	"with smoked Dick"
}

local function RandomPlayGame()
	sleep(15)
	while true do
		--Client:setGame(Games[math.random(1,#Games)])
		local Time = math.random(5,120)
		print('Time until the next Game: ' .. Time)
		sleep(Time)
	end
end

Client:on('ready', function()
	print('Logged in as '.. Client.user.username)
	RandomPlayGame()
end)

Client:on('messageCreate', function(Message)
	print("Content: " .. Message.content)
	if Message.content == '!ping' then
		Message.channel:send('I will raip you, Pedo.')
	elseif Message.content == '!on' then
		Client:setStatus('online')
	elseif Message.content == '!busy' then
		Client:setStatus('dnd')
	end
end)

Client:on('typingStart', function(UserId,ChannelId,Timestamp)
	print('Channel: ' .. ChannelId)
	print('Time: ' .. Timestamp)
	local Channel = Client:getChannel(ChannelId)
	if Channel then
		local M = Channel:send('Rape')
		sleep(3)
		if M then M:delete() end
	end
end)

Client:run('Bot NDU3ODMxNjM5MDYyNjc1NDU3.Dge35w.a3tt3pRXrrRl9qe5IyH4GoPz-54')
