class Api::V1::ShopsController < Api::V1::BaseController
  around_action :wrap_in_transaction, only: :create

  def create
    Shop.where(company_id: current_user.company.id).delete_all
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

  def wrap_in_transaction
    ActiveRecord::Base.transaction do
      begin
        yield
      ensure
        raise ActiveRecord::Rollback
      end
    end
  end

  def shop_params(my_params)
    my_params.permit(:accounting_system_code, :title, :address, :latitude, :longitude, :company_id)
  end
end
