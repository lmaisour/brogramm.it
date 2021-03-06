class User < ActiveRecord::Base
	has_many :rooms
	has_many :comments, dependent: :delete_all

	def self.create_from_omniauth(auth_hash)
  	self.create(provider: auth_hash[:provider],
      uid: auth_hash[:uid],
      name: auth_hash[:info][:name])
	end
	
end