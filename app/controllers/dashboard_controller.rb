class DashboardController < ApplicationController

  def index
    @project = Project.find(params[:project_id])
    @chart_data = IndicatorMeasure.trend_for_project(@project)
    @iteration = fetchIteration
    @indicator_measures = IndicatorMeasure.for_iteration(@iteration)
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
