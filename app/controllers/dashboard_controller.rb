class DashboardController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @indicator_measures = IndicatorMeasure.for_project(@project)
  end
end
