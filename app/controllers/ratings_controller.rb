class RatingsController < ApplicationController
  def index
    @indicators = Indicator.find(:all, :order => "sort_order")
    @project = Project.find(params[:project_id])
    @span = Span.where(project: @project).where(status: 'current').first
  end

  def create
    span = Span.where(project_id: params[:project_id]).where(status: 'current').first
    indicators = Indicator.find(:all)
    indicators.each do |indicator|
      score = params[:scores]["#{indicator.id}"]
      score = nil if score == "0"
      Rating.create(span: span, indicator: indicator, score: score)

      message = params[:comments]["#{indicator.id}"]
      unless message.blank?
        Comment.create(span: span, indicator: indicator, comment: message)
      end
    end

    flash[:message] = "Vote submitted"
    redirect_to project_ratings_path(project_id: params[:project_id])
  end
end