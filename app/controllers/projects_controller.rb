class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy,:update_indicators]

  # GET /projects
  def index
    @projects = Project.all
  end

  # GET /projects/1
  def show
    @spans = Span.where(project_id: @project.id).order("created_at desc")
    @span = Span.new
    @indicators = Indicator.all
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
    Indicator.all.each do |indicator|

      present_project_indicator = ProjectIndicator.where("project_id = ? and indicator_id = ?",@project.id,indicator).first
      if params[indicator.name]
        ProjectIndicator.create(project: @project, indicator: indicator) unless present_project_indicator
      else
        if present_project_indicator
          present_project_indicator.destroy 
        end
      end
    end
    redirect_to @project ,notice: 'Project indicators successfully updated'
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
