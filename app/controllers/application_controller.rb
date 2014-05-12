class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :force_login
  

  def index
    project = Project.all.first
    if project == nil
      redirect_to projects_path
    elsif browser.tablet? || browser.mobile?
      redirect_to project_ratings_path(project_id: project.id)
    else
      redirect_to project_dashboard_index_path(project_id: project.id)
    end
  end
  
  protected
  def requires_login
    return true
  end
  
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def force_login
    if requires_login && current_user == nil
      redirect_to SessionsHelper.login_path 
    end
  end

  helper_method :current_user
end
