class ApplicationController < ActionController::Base
  protect_from_forgery

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
end
