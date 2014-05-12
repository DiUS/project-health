class RatingsController < ApplicationController
  before_filter :load
  
  def index
    indicators = @project.indicators(order: :sort_order)
    @indicators_by_category = indicators.group_by &:category
    
    if has_user_voted_yet?
      render 'already_voted'
    end
  end

  def create
    if has_user_voted_yet?
      render 'already_voted'
    else
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
  end
  
  def already_voted
    
  end
  
  protected
  def requires_login
    return true
  end
  
  private
  
  def load
    @project = Project.find(params[:project_id])
    @iteration = Iteration.current_by_project(@project)
  end
  
  def has_user_voted_yet?
    return current_user.has_voted_for? @iteration
  end
  
  
end