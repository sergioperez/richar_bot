class User
	include DataMapper::Resource

	property :id,	String, :key => true

	has n, :cobres
end
