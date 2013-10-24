class RatingsController < ApplicationController
  def index
    @indicators = Indicator.find(:all, :order => "sort_order")
    @project = Project.find(params[:project_id])
    @iteration = Iteration.where(project: @project).where(status: 'current').first
  end

  def create
    flash[:message] = "Vote submitted"
    redirect_to project_ratings_path(project_id: params[:project_id])
  end
end