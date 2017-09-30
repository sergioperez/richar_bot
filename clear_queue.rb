#Used instead of bot on a case where
#it is needed to clear the bot queue

require 'telegram/bot'
require_relative 'functionalities'
require_relative 'functionalities/cobre'
require_relative 'functionalities/cobrerank'
require_relative 'functionalities/start'
require_relative 'functionalities/stop'

token = File.read("token.conf").chomp

Telegram::Bot::Client.run(token) do |bot|
	begin
	bot.listen do |message|
	end
	rescue Telegram::Bot::Exceptions::ResponseError => e
		puts "samatao"
	end
end
