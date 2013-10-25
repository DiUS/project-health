class SpansController < ApplicationController
  before_action :set_span, only: [:show, :edit, :update, :destroy]

  # GET /spans
  def index
    @spans = Span.all
  end

  # GET /spans/1
  def show
  end

  # GET /spans/new
  def new
    @span = Span.new
  end

  # GET /spans/1/edit
  def edit
  end

  # POST /spans
  def create


    @project = Project.find(params[:project_id])

    @span = Span.new(span_params)
    @span.project = @project

    if @span.save
      redirect_to project_path(@project), notice: 'span was successfully created.'
    else
      redirect_to project_path(@project), notice: 'span was not sucsessfully created.'
    end
  end

  # PATCH/PUT /spans/1
  def update
    if @span.update(span_params)
      redirect_to @span, notice: 'span was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /spans/1
  def destroy
    @span.destroy
    redirect_to spans_url, notice: 'span was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_span
      @span = Span.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def span_params
      params.require(:span).permit(:name, :status, :sort_order,:project_id)
    end
end
