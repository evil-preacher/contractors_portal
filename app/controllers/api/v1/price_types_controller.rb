class Api::V1::PriceTypesController < Api::V1::BaseController
  def create
    params["price_types"].each do |key, value|
      @price_type = current_user.company.price_types.create(price_type_params(value))
    end
    if @price_type.save
      render json: {success: 'Заявки выгружены'}, status: :created
    else
      render json: {failed: 'Заявки не выгружены'}, status: :unprocessable_entity
    end
  end

  private

  def price_type_params(my_params)
    my_params.permit(:accounting_system_code, :title)
  end
end
