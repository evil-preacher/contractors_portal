class Api::V1::CategoriesController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token

  def batch_create
    success = current_user.company.categories.batch_create(request.raw_post)
    if success
      render json: {success: 'Категории загружены'}, status: :created
    else
      render json: {failed: 'Категории не загружены'}, status: :unprocessable_entity
    end
  end

  def clear_all
    current_user.company.categories.clear_all
  end

  private

  def category_params
    params.require(:category).permit(:accounting_system_code, :title, :parent_code)
  end
end
