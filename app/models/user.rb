require 'data_mapper'
require 'dm-postgres-adapter'

class User
  include DataMapper::Resource

  attr_reader :password

  property :id, Serial
  property :email, String
  property :password, String
end
