require 'telegram/bot'
require_relative 'functionalities'
require_relative 'functionalities/cobre'
require_relative 'functionalities/cobrerank'
require_relative 'functionalities/start'
require_relative 'functionalities/stop'

token = File.read("/home/sergio/tokens/richar.conf").chomp

Telegram::Bot::Client.run(token) do |bot|
	begin
	bot.listen do |message|
		message.text.downcase! if message.text != nil
		case message.text
		when 'cobre'
			cobre(bot, message)
		when '!cobrerank'
			cobrerank(bot, message)
		when ':('
			#TODO
		when '/start'
			start(bot, message)
		when '/stop'
			stop(bot, message)
		end
	end
	rescue Telegram::Bot::Exceptions::ResponseError => e
		puts "samatao"
		retry
	end
end
