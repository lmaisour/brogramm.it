class SessionsController < ApplicationController

  def new
    redirect_to '/auth/github'
  end

  def create
    @user = User.find_by_provider_and_uid(auth_hash[:provider], auth_hash[:uid]) || User.create_from_omniauth(auth_hash)
    if @user
         session[:user_id] = @user.id
         redirect_to rooms_path
    else
         redirect_to root_url
    end
  end

  def destroy
    reset_session
    redirect_to root_url
  end

   def auth_fail
    render text: "You've tried to authenticate via #{params[:strategy]}, but it failed"
  end


  protected
    def auth_hash
      request.env['omniauth.auth']
    end
end