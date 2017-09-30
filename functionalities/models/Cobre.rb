class Cobre
	include DataMapper::Resource

	property :id,	Serial
	property :date, Date, :unique_index => :u
	property :group, Integer, :unique_index => :u
	property :user, Integer 

	#belongs_to :group
	#belongs_to :user
	

	def to_str
		"#{@id}, #{@date}, #{@user}"
	end
end
