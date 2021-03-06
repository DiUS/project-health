class SessionsController < ApplicationController
  def create
    user = User.find_or_create_from_google_auth_hash(auth_hash)
    session[:user_id] = user.id
    redirect_to root_url
  end
  
  def destroy
    reset_session
    redirect_to root_url
  end

  protected
  def requires_login
    return false
  end

  def auth_hash
    request.env['omniauth.auth']
  end
end
