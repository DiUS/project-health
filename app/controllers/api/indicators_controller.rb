class Api::IndicatorsController < Api::AbstractApiController

  protected
  def getObjectClass
    return Indicator
  end

  def safe_params
    params.permit(:name, :description, :one_label, :five_label, :sort_order, :category_id)
  end

  def json_include
    return :category
  end
end
