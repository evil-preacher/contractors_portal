class Api::V1::ProductsController < Api::V1::BaseController
  def create
    Product.where(company_id: current_user.company.id).delete_all
    @wrong_objects = []
    params["products"].each do |key, value|
      if value[:asc] && value[:title] && value[:category_asc]
        @product = current_user.company.products.create!(product_params(value))
      else
        @wrong_objects << key
      end
    end
    if @wrong_objects.empty?
      render json: {success: 'Товары выгружены'}, status: :created
    else
      render json: {failed: "Товары не выгружены, некорректные данные: #{@wrong_objects}" }, status: :unprocessable_entity
      Product.where(company_id: current_user.company.id).delete_all
    end
  end

  private

  def product_params(my_params)
    my_params.permit(:asc,
                     :title,
                     :barcode,
                     :company_id,
                     :category_asc,
                     :brand_asc)
  end
end
