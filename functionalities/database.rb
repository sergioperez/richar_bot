#If you want the logs displayed you have to do this before the call to setup
require 'rubygems'
require 'data_mapper'
require 'dm-migrations'


DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, 'sqlite:project.db')


#require_relative 'models/User'
#require_relative 'models/Group'
require_relative 'models/Cobre'


DataMapper.finalize.auto_upgrade!
