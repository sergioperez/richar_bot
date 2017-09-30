require_relative 'database'

def cobre(bot, message)
	@date = Time.now.to_date
	@group = message.chat.id
	@user = message.from.id

	@cobre = Cobre.all(:date => @date, :group => @group)
	if @cobre.size == 0
		@cobre = Cobre.create(:date =>	@date,
													:user =>	@user,
													:group =>	@group
												 )

		bot.api.send_message(chat_id: message.chat.id, text: "Er payo @#{message.from.username} a robaol cobre, joder.")
	end
end
