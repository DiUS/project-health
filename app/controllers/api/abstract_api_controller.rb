class Api::AbstractApiController < ApplicationController
  before_action :load_object, except: [:index, :create]
  def index
    objects = getObjectClass.send :all
    render json: objects, include: json_include
  end

  def destroy
    @object.destroy!
    head :no_content
  end

  def show
    render json: @object, include: json_include
  end

  def update
    if @object.update(safe_params)
      head :no_content
    else
      render status: :unprocessable_entity, json: @object.errors.full_messages
    end
  end

  def create
    @object = getObjectClass.send :new
    update
  end

  protected
  def getObjectClass
    raise "getObjectClass must be overwritten"
  end

  def safe_params
    raise "safe params must be overwritten"
  end

  def json_include
    return []
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
