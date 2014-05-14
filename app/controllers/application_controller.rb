class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :check_login
  
  protected
  def requires_login
    return true
  end
  
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def check_login
    if requires_login && current_user == nil
      redirect_to SessionsHelper.login_path 
    end
  end

  helper_method :current_user
end
