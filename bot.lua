local Discordia = require('discordia')
local Client = Discordia.Client()
local Clock = os.clock
local WinAPI = require('winapi')

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
	WinAPI.sleep(math.random(1,5))
	if M then M:delete() end
end

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

Client:on('typingStart', function(UserId,ChannelId,Timestamp)
	if Clock() > NextGameChange then
		NextGameChange = Clock() + (math.random(10,120))
		Client:setGame(Games[math.random(1,#Games)])
	end
	local User = Client:getUser(UserId)
	local Channel = Client:getChannel(ChannelId)
	if User and Channel and 10 > (math.random()*100) then
		sleep(math.random(1,5))
		RandomMessage(User,Channel)
	end
end)

Client:run('Bot NDU3ODMxNjM5MDYyNjc1NDU3.Dge35w.a3tt3pRXrrRl9qe5IyH4GoPz-54')
