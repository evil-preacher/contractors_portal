class Api::V1::ShopsController < Api::V1::BaseController
  def create
    current_user.company.shops.each do |shop|
      if shop.routes.empty?
        shop.destroy
      end
    end
    @wrong_objects = []
    params["shops"].each do |key, value|
      if value[:asc] && value[:title]
        @shop = current_user.company.shops.create(shop_params(value))
      else
        @wrong_objects << key
      end
    end
    if @wrong_objects.empty?
      render json: {success: 'Контрагенты выгружены'}, status: :created
    else
      render json: {failed: "Контрагенты не выгружены, некорректные данные: #{@wrong_objects}"}, status: :unprocessable_entity
      current_user.company.shops.each do |shop|
        if shop.routes.empty?
          shop.destroy
        end
      end
    end
  end

  private

  def shop_params(my_params)
    my_params.permit(:asc,
                     :title,
                     :address,
                     :latitude,
                     :longitude,
                     :company_id)
  end
end
