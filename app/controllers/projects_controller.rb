class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :update_indicators, :update_users]

  # GET /projects
  def index
    @projects = Project.all
  end

  # GET /projects/1
  def show
    @iterations = Iteration.where(project_id: @project.id).order("sort_order desc")
    @iteration = Iteration.new
    @indicators = Indicator.all
    @indicators_by_category = @indicators.group_by &:category
    @users = User.all
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /projects/1
  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'Project was successfully destroyed.'
  end

  def update_indicators
    @project.indicators = Indicator.where(id: params["indicators"]);
    @project.save!
    redirect_to @project, notice: 'Project indicators successfully updated'
  end

  def update_users
    @project.users = User.where(id: params["users"]);
    @project.save!
    redirect_to @project, notice: 'Project staff successfully updated'
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project

    puts "params #{params.inspect}"
      @project = Project.find(params[:id]) if params[:id]
      @project = Project.find(params[:project_id]) unless @project
    end

    # Only allow a trusted parameter "white list" through.
    def project_params
      params.require(:project).permit(:name)
    end
end
