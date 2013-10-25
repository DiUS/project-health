class IterationsController < ApplicationController
  before_action :set_iteration, only: [:show, :edit, :update, :destroy]

  # GET /iterations
  def index
    @iterations = Iteration.all
  end

  # GET /iterations/1
  def show
  end

  # GET /iterations/new
  def new
    @iteration = Iteration.new
  end

  # GET /iterations/1/edit
  def edit
  end

  # POST /iterations
  def create


    @project = Project.find(params[:project_id])

    @iteration = Iteration.new(iteration_params)
    @iteration.project = @project

    if @iteration.save
      redirect_to project_path(@project), notice: 'Iteration was successfully created.'
    else
      redirect_to project_path(@project), notice: 'Iteration was not sucsessfully created.'
    end
  end

  # PATCH/PUT /iterations/1
  def update
    if @iteration.update(iteration_params)
      redirect_to @iteration, notice: 'Iteration was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /iterations/1
  def destroy
    @iteration.destroy
    redirect_to iterations_url, notice: 'Iteration was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_iteration
      @iteration = Iteration.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def iteration_params
      params.require(:iteration).permit(:name, :status, :sort_order,:project_id)
    end
end
