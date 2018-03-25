class Api::V1::CategoriesController < Api::V1::BaseController
  # def batch_create
  #   Category.where(company_id: current_user.company.id).delete_all
  #   success = current_user.company.categories.batch_create(request.raw_post)
  #   if success
  #     render json: {success: 'Категории загружены'}, status: :created
  #   else
  #     render json: {failed: 'Категории не загружены'}, status: :unprocessable_entity
  #   end
  # end

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
