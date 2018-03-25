class Api::V1::CategoriesController < Api::V1::BaseController
  def create
    params["categories"].each do |key, value|
      @category = current_user.company.categories.create(category_params(value))
    end
    if @category.save
      render json: {success: 'Заявки выгружены'}, status: :created
    else
      render json: {failed: 'Заявки не выгружены'}, status: :unprocessable_entity
    end
  end

  private

  def category_params(my_params)
    my_params.permit(:accounting_system_code, :title, :parent_code)
  end
end
