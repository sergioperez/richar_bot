require_relative 'database'

#Behavior
# cobrerank is called and:
#   cobrerank => get_cobrerank
#   cobrerank => send_cobrerank

def get_photo(bot, user_id)
	puts user_id
	@photo = bot.api.get_user_profile_photos(user_id: user_id, limit: 1)
	puts "jejeje"
	return @photo["result"]["photos"][0][0]["file_id"]
end

def get_cobrerank(bot, chat_id)
	@cobres = Cobre.all(:group => chat_id)
	@group_users = Hash.new
	@user_id = Hash.new

	#Get the number of "cobres" for each user id
	@cobres.each do |cobre|
		user = bot.api.get_chat_member(chat_id: chat_id, user_id: cobre.user)["result"]["user"]["first_name"]
		@user_id[user] = cobre.user
		@group_users[user] = 0 if @group_users[user] == nil
		@group_users[user] += 1
	end
	
	@group_users = @group_users.sort

	@group_users.sort_by!{|k,v| v}
	@group_users.reverse!

	#Append the user_id to the returned data (useful to get the image picture later on)
	@group_users.each do |user|
		user << @user_id[user[0]]
	end

	puts "#{@group_users}"

	return @group_users
end

def send_cobrerank(bot, chat_id, cobrerank)
	@msg = "Man llevao la fragonetal mecanico payo, llasarreglara bien\bMira los payos:\n"
	num = 0
	cobrerank.each do |pos|
		num += 1
		puts num
		next if num == 1

		@msg << "#{pos[0]} Cu #{pos[1]} kg"
		@msg << "\n"
	end
	bot.api.send_message(chat_id: chat_id, text: "Er rei der cobre")
	bot.api.send_photo(chat_id: chat_id, photo: get_photo(bot, cobrerank[0][2]))
	bot.api.send_message(chat_id: chat_id, text: "#{@msg}\n")
end


def cobrerank(bot, message)
	@cobrerank = get_cobrerank(bot, message.chat.id)
	send_cobrerank(bot, message.chat.id, @cobrerank)
end
