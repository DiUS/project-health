class Api::IndicatorsController < ApplicationController
  before_action :load_object, except: [:index, :create]
  def index
    objects = getObjectClass.send :all
    render json: objects
  end

  def destroy
    @object.destroy!
    head :no_content
  end

  def show
    render json: @object
  end

  def update
    if @object.update(safe_params)
      head :no_content
    else
      render status: :unprocessable_entity, json: @object.errors.full_messages
    end
  end

  def create
    @object = Indicator.new
    update
  end

  protected
  def getObjectClass
    return Indicator
  end

  def safe_params
    params.permit(:name, :description, :one_label, :five_label, :sort_order, :category_id)
  end

  public
  def load_object
    begin
      @object = getObjectClass.send :find_by, {id: params[:id]}
    rescue
      head :not_found
    end
  end
end
