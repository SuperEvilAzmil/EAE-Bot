local Discordia = require('discordia')
local Client = Discordia.Client()

Client:on('ready', function()
	print('Logged in as '.. Client.user.username)
end)

Client:on('messageCreate', function(Message)
	if Message.content == '!ping' then
		Message.channel:send('I will raip you, Pedo.')
	end
end)

Client:run('Bot NDU3ODMxNjM5MDYyNjc1NDU3.Dge35w.a3tt3pRXrrRl9qe5IyH4GoPz-54')