class Api::V1::CategoriesController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token

  def index
    render json: @categories = current_user.company.categories
  end

  def batch_create
    success = current_user.company.categories.batch_create(request.raw_post)
    if success
      render json: {success: 'categories added'}, status: :created
    else
      render json: {failed: 'categories not added'}, status: :unprocessable_entity
    end
  end


  private

  def category_params
    params.require(:category).permit(:accounting_system_code, :title, :parent_code)
  end
end
