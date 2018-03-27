class Api::V1::ShopsController < Api::V1::BaseController
  def create
    Shop.where(company_id: current_user.company.id).delete_all
    @wrong_objects = []
    params["shops"].each do |key, value|
      if value[:accounting_system_code] && value[:title]
        @shop = current_user.company.shops.create(shop_params(value))
      else
        @wrong_objects << key
      end
    end
    if @wrong_objects.empty?
      render json: {success: 'Контрагенты выгружены'}, status: :created
    else
      render json: {failed: "Контрагенты не выгружены, некорректные данные: #{@wrong_objects}"}, status: :unprocessable_entity
      Shop.where(company_id: current_user.company.id).delete_all
    end
  end

  private

  def shop_params(my_params)
    my_params.permit(:accounting_system_code,
                     :title,
                     :address,
                     :latitude,
                     :longitude,
                     :company_id)
  end
end
