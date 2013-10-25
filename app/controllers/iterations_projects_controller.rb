class IterationsProjectsController < ApplicationController
  before_action :set_project


  # POST /iterations
  def create
    @iteration = Iteration.new(iteration_params)
    @iteration.project = @project

    if @iteration.save
      redirect_to iterations_projects_path(@project), notice: 'Iteration was successfully created.'
    else
      redirect_to iterations_projects_path(@project), notice: 'Iteration was not sucsessfully created.'
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.

    def set_project
      @project = Iteration.find(params[:project_id])
    end

    # Only allow a trusted parameter "white list" through.
    #def iteration_params
    #  params.require(:iteration).permit(:name, :status, :sort_order)
    #end
end
