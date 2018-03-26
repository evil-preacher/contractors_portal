class Api::V1::CategoriesController < Api::V1::BaseController

  def create
    Category.where(company_id: current_user.company.id).delete_all
    @categories = []
    @wrong_objects = []
    @counter = 0
    params["categories"].each do |key, value|
      @counter += 1
      if value[:accounting_system_code] && value[:title]
        @category = current_user.company.categories.create(category_params(value))
        @categories << @category
      else
        @wrong_objects << key
      end
    end
    if @categories.length == @counter
      render json: {success: 'Категории выгружены'}, status: :created
    else
      render json: {failed: "Категории не выгружены, некорректные данные: #{@wrong_objects}"}, status: :unprocessable_entity
      Category.where(company_id: current_user.company.id).delete_all
    end
  end

  private

  def category_params(my_params)
    my_params.permit(:accounting_system_code, :title, :parent_code)
  end
end
