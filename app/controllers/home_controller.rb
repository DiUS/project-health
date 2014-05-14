class HomeController < ApplicationController
  def index
    @my_projects = current_user.projects
    @pending_ratings = @my_projects.find_all { |project|
      (project.current_iteration != nil) && !current_user.has_voted_for?(project.current_iteration)}
  end
end
