class Api::V1::ShopsController < Api::V1::BaseController
  def create
    params["shops"].each do |key, value|
      @shop = current_user.company.shops.create(shop_params(value))
    end
    if @shop.save
      render json: {success: 'Заявки выгружены'}, status: :created
    else
      render json: {failed: 'Заявки не выгружены'}, status: :unprocessable_entity
    end
  end

  private

  def shop_params(my_params)
    my_params.permit(:accounting_system_code, :title, :address, :latitude, :longitude, :company_id)
  end
end
