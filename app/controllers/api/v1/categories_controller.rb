class Api::V1::CategoriesController < Api::V1::BaseController
  def create
    Category.where(company_id: current_user.company.id).delete_all
    @wrong_objects = []
    params["categories"].each do |key, value|
      if value[:asc] && value[:title]
        @category = current_user.company.categories.create(category_params(value))
      else
        @wrong_objects << key
      end
    end
    if @wrong_objects.empty?
      render json: {success: 'Категории выгружены'}, status: :created
    else
      render json: {failed: "Категории не выгружены, некорректные данные: #{@wrong_objects}"}, status: :unprocessable_entity
      Category.where(company_id: current_user.company.id).delete_all
    end
  end

  private

  def category_params(my_params)
    my_params.permit(:asc,
                     :title,
                     :parent_code)
  end
end
