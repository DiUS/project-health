class DashboardController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @iteration = Iteration.current(@project)
    @indicator_measures = IndicatorMeasure.for_project(@project)
  end
end
