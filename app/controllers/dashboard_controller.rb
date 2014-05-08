class DashboardController < ApplicationController
  before_action :set_project

  def index
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

  def set_project
    @project = Project.find(params[:project_id])
  end
end
