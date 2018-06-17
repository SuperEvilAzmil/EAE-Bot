local Discordia = require('discordia')
local Client = Discordia.Client()
local Clock = os.clock

function wait(s)
	local ntime = os.clock() + s
	repeat until os.clock() > ntime
end

local NextGameChange = Clock() + 15

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

local function RandomMessage(User,Channel)
	local Choices = {
		"Rape",
		"Penis",
		"Vagina",
		"<@" .. User.id .. "> Rape",
		"<@" .. User.id .. "> ***RAPE***",
		"I want rape",
		"I heard you want rape",
		"Cum",
		"**SEX**",
		"<@" .. User.id .. "> **SEX**",
		"Pei Pei",
		"My penis hurt...",
		"I have two penis. Deal with it.",
		"Where is my penis?",
		"Bullshit",
		"<@" .. User.id .. "> I will touch your fucking dick.",
		"<@" .. User.id .. "> ***SUCK MY DICK***",
	}

	local M = Channel:send(Choices[math.random(1,#Choices)])
	wait(math.random(1,5))
	if M then M:delete() end
end

Client:on('ready', function()
	print('Logged in as '.. Client.user.username)
end)

Client:on('messageCreate', function(Message)
	if Message.content == '!ping' then
		Message.channel:send('I will raip you, Pedo.')
	elseif Message.content == '!on' then
		Client:setStatus('online')
	elseif Message.content == '!busy' then
		Client:setStatus('dnd')
	end
end)

Client:on('typingStart', function(UserId,ChannelId,Timestamp)
	print(Clock())
	print(NextGameChange)
	if Clock() > NextGameChange then
		NextGameChange = Clock() + (math.random(10,120))
		Client:setGame(Games[math.random(1,#Games)])
	end
	local User = Client:getUser(UserId)
	local Channel = Client:getChannel(ChannelId)
	local Chance = (math.random()*100)
	print('Chance: ' .. Chance)
	if User and Channel and 10 > Chance then
		wait(math.random(1,5))
		RandomMessage(User,Channel)
	end
end)

Client:run('Bot NDU3ODMxNjM5MDYyNjc1NDU3.Dge35w.a3tt3pRXrrRl9qe5IyH4GoPz-54')
