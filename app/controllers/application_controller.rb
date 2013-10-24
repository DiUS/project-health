class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
    puts "HERE!!!"
    # format.html {
      if browser.tablet? || browser.mobile?
        project = Project.find_first
        iteration = Iteration.where(project: project).order("sort_order DESC").first
        redirect_to ratings_path(project, iteration)
      else
        redirect_to indicators_path # CHANGE ME TO DASHBOARD !
      end
    # }
  end
end
