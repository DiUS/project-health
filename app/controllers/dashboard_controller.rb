class DashboardController < ApplicationController
  def index
    @indicators = Indicator.all
    @project = Project.find(params[:project_id])
  end
end
