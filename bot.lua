local Discordia = require('discordia')
local Client = Discordia.Client()

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

Client:on('ready', function()
	print('Logged in as '.. Client.user.username)
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

Client:run('Bot NDU3ODMxNjM5MDYyNjc1NDU3.Dge35w.a3tt3pRXrrRl9qe5IyH4GoPz-54')

--[[ sleep(5)

while true do
	sleep(5+(math.random()*30))
	Client:setGame(Games[math.random(1,#Games)])
end ]]