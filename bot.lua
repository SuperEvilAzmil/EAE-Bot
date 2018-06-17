local Discordia = require('discordia')
local Client = Discordia.Client()

Client:on('ready', function()
	print('Logged in as '.. Client.user.username)
end)

Client:on('messageCreate', function(message)
	if message.content == '!ping' then
		message.channel:send('Pong!')
	end
end)

Client:run('Bot NDU3ODMxNjM5MDYyNjc1NDU3.Dge35w.a3tt3pRXrrRl9qe5IyH4GoPz-54')