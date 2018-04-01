class Api::V1::PriceTypesController < Api::V1::BaseController
  def create
    PriceType.where(company_id: current_user.company.id).delete_all
    @wrong_objects = []
    params["price_types"].each do |key, value|
      if value[:asc] && value[:title]
        @price_type = current_user.company.price_types.create(price_type_params(value))
      else
        @wrong_objects << key
      end
    end
    if @wrong_objects.empty?
      render json: {success: 'Типы цен выгружены'}, status: :created
    else
      render json: {failed: "Типы цен не выгружены, некорректные данные: #{@wrong_objects}" }, status: :unprocessable_entity
       PriceType.where(company_id: current_user.company.id).delete_all
    end
  end

  private

  def price_type_params(my_params)
    my_params.permit(:accounting_system_code, :title)
  end
end
