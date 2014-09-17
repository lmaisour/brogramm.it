class User < ActiveRecord::Base
	has_many :user_rooms
	has_many :rooms, :through => :user_rooms
	
	def self.create_from_omniauth(auth_hash)
  	self.create(provider: auth_hash[:provider],
      uid: auth_hash[:uid],
      name: auth_hash[:info][:name])
	end
	
end