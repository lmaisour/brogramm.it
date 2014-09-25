class UsersController < ApplicationController   

	def new
	end

	def index
	end

	def show
	end

	def destroy
	end

	def self.create_from_omniauth(auth_hash)
  		self.create(provider: auth_hash[:provider],
      	uid: auth_hash[:uid],
        name: auth_hash[:info][:name])
	end
	
	def create
	end



end