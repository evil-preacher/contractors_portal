class Api::V1::BrandsController < Api::V1::BaseController
  def create
    Brand.where(company_id: current_user.company.id).delete_all
    @wrong_objects = []
    params["brands"].each do |key, value|
      if value[:asc] && value[:title]
        @brand = current_user.company.brands.create(brand_params(value))
      else
        @wrong_objects << key
      end
    end
    if @wrong_objects.empty?
      render json: {success: 'Бренды выгружены'}, status: :created
    else
      render json: {failed: "Бренды не выгружены, некорректные данные: #{@wrong_objects}"}, status: :unprocessable_entity
      Brand.where(company_id: current_user.company.id).delete_all
    end
  end

  private

  def brand_params(my_params)
    my_params.permit(:accounting_system_code, :title)
  end
end
