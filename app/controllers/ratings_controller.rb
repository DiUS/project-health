class RatingsController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @project_indicators = ProjectIndicator.joins(:indicator).where("project_id = ?", @project.id).order("indicators.sort_order")
    @iteration = Iteration.current_by_project(@project)
  end

  def create
    project = Project.find(params[:project_id])
    iteration = Iteration.current_by_project(project)
    
    indicators = Indicator.find(:all)
    indicators.each do |indicator|
      score = params[:scores]["#{indicator.id}"]
      score = nil if score == "0"
      Rating.create(iteration: iteration, indicator: indicator, score: score)

      message = params[:comments]["#{indicator.id}"]
      unless message.blank?
        Comment.create(iteration: iteration, indicator: indicator, comment: message)
      end
    end

    flash[:message] = "Vote submitted"
    redirect_to project_ratings_path(project_id: params[:project_id])
  end
end