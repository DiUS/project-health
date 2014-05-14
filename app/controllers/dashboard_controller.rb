class DashboardController < ApplicationController

  def index
    @project = Project.find(params[:project_id])
    @iteration = fetchIteration

    @chart_data = IndicatorMeasure.trend_for_project(@project) if @iteration
    @indicator_measures = IndicatorMeasure.for_iteration(@iteration) if @iteration

    unless @iteration
      render "not_enough_data"
    end
  end
  
  private
  
  def fetchIteration
    if params[:iteration_id]
      return Iteration.find(params[:iteration_id])
    else
      return Iteration.current_by_project(@project)
    end
  end

end
