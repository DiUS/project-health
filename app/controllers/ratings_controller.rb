class RatingsController < ApplicationController
  before_filter :load, :check_user_is_assigned, :check_user_has_not_voted_yet
  
  def index
    indicators = @project.indicators(order: :sort_order)
    @indicators_by_category = indicators.group_by &:category
  end

  def create
    indicators = @project.indicators
    indicators.each do |indicator|
      score = params[:scores]["#{indicator.id}"]
      score = nil if score == "0"
      Rating.create(iteration: @iteration, indicator: indicator, score: score)

      message = params[:comments]["#{indicator.id}"]
      unless message.blank?
        Comment.create(iteration: @iteration, indicator: indicator, comment: message)
      end
    end

    current_user.voted_for @iteration

    flash[:message] = "Vote submitted"
    redirect_to project_dashboard_index_path(project_id: @project.id)
  end
  
  def already_voted
    
  end
  

  private
  
  def load
    @project = Project.find(params[:project_id])
    @iteration = Iteration.current_by_project(@project)
  end
  
  def check_user_has_not_voted_yet
    if current_user.has_voted_for? @iteration
      render 'already_voted'
    end
  end

  def check_user_is_assigned
    unless @project.users.include? current_user
      redirect_to root_path, notice: "You are not assigned to this project!"
    end
  end
  
  
end