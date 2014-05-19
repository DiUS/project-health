class Api::CategoriesController < Api::AbstractApiController

  protected
  def getObjectClass
    return Category
  end

  def safe_params
    params.permit(:name)
  end

end
