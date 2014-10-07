class SessionsController < ApplicationController

  def new
    redirect_to '/auth/github'
  end

  # def create
  #   @user = User.find_by_provider_and_uid(auth_hash[:provider], auth_hash[:uid]) || User.create_from_omniauth(auth_hash)
  #   if @user
  #        session[:user_id] = @user.id
  #        redirect_to rooms_path
  #   else
  #        redirect_to root_url
  #   end
  # end

  def create     
    auth = request.env["omniauth.auth"]     
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)     
    session[:user_id] = user.id     
    redirect_to root_url
  end

  def destroy
    reset_session
    redirect_to root_url
  end


  protected
    def auth_hash
      request.env['omniauth.auth']
    end
end