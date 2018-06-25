local Discordia = require('discordia')
local Client = Discordia.Client()
local Time = os.time

function wait(s)
	Client:setStatus('dnd')
	local ntime = os.time() + s
	repeat until os.time() > ntime
	Client:setStatus('online')
end

local NextGameChange = Time() + 15

local Games = {
	"Noob VS Zombie",
	"Zombie Town",
	"The Zombie's Onslaught",
	"NVZ Realish",
	"ZD4",
	"ZCR",
	"BTSTUB",
	"Raipei Simulator",
	"with smoked Dick",
	"Jelly Dildo"
}

local function RandomMessage(User,Channel)
	local Choices = {
		"Rape",
		"Penis",
		"Vagina",
		"Cum",
		"Gay",
		"Dick",
		"Boob",
		"Bullshit",
		"Pedo",
		"Boy",
		"Girl",
		"You're bullshit",
		"I want rape",
		"I heard you want rape",
		"You are gay",
		"**SEX**",
		"Pei Pei",
		"My penis hurt...",
		"I have two penis. Deal with it.",
		"I have a dick but my testis is missing",
		"Where is my penis?",
		"I'm having SEX with my mom",
		"My dad gonna rape me harder",
		"There's yogurt on the floor. Go lick it. It contain Vitamin.",
		"Suck my dick",
		"I smell a penis",
		"Go fuck yourself",
		"Are you looking for SEX? I'm here",
		"Put your dick onto the bun. Now it's called **Hotdick**",
		"I suck my own dick and testis. It's good and fine.",
		"Who want SEX?",
		"I can wait for anyone who wanting a SEX",
		"**YOUR ASSHOLE, UGLY**",
		"<@" .. User.id .. "> I know that you're going to be transgender. Let me touch your vagina.",
		"<@" .. User.id .. "> **SEX**",
		"<@" .. User.id .. "> Rape",
		"<@" .. User.id .. "> **RAPE**",
		"<@" .. User.id .. "> I will touch your fucking dick.",
		"<@" .. User.id .. "> **SUCK MY DICK**",
		"<@" .. User.id .. "> You want penis?",
		"<@" .. User.id .. "> You want SEX?",
		"<@" .. User.id .. "> Is your Urine edible to drink?",
		"<@" .. User.id .. "> **GIVE ME YOUR PENIS**",
		"<@" .. User.id .. "> **I'M GONNA CUT OF YOUR PENIS**",
		"<@" .. User.id .. "> Give me your jelly Dildo",
		"<@" .. User.id .. "> You smell like a penis",
	}

	local M = Channel:send(Choices[math.random(1,#Choices)])
	--[[wait(math.random(1,5))
	if M then M:delete() end]]
end

Client:on('ready', function()
	print('Logged in as '.. Client.user.username)
	Client:setGame(nil)
	local Channel = Client:getChannel('228252059181383683')
	if Channel then
		local M = Channel:send('https://t2.rbxcdn.com/486d351f809891f46a42428af3dad3e5')
		--[[wait(5)
		if M then M:delete() end]]
	end
end)

Client:on('messageCreate', function(Message)
	if Message.content == '!ping' then
		Message.channel:send('I will raip you, Pedo.')
	--[[elseif Message.content == '!on' then
		Client:setStatus('online')
	elseif Message.content == '!busy' then
		Client:setStatus('dnd')]]
	end
end)

Client:on('typingStart', function(UserId,ChannelId,Timestamp)
	--print(Time())
	--print(NextGameChange)
	if Time() > NextGameChange then
		NextGameChange = Time() + (math.random(10,120))
		Client:setGame(Games[math.random(1,#Games)])
	end
	local User = Client:getUser(UserId)
	local Channel = Client:getChannel(ChannelId)
	local Chance = (math.random()*100)
	--print('Chance: ' .. Chance)
	if User and Channel and 10 > Chance then
		wait(math.random(1,5))
		RandomMessage(User,Channel)
	end
end)

Client:run('Bot NDU3ODMxNjM5MDYyNjc1NDU3.Dge35w.a3tt3pRXrrRl9qe5IyH4GoPz-54')
