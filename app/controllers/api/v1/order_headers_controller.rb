class Api::V1::OrderHeadersController < Api::V1::BaseController
  after_action :update_loaded_status, only: :index
  def index
    render json: @orders = current_user.company.order_headers.includes(:order_tables).where(loaded: false)
  end

  def create
    params["orders"].each do |key, value|
      @order_header = current_user.company.order_headers.create(order_params(value))
    end
    if @order_header.save
      render json: {success: 'Заявки загружены'}, status: :created
    else
      render json: {failed: 'Заявки не загружены'}, status: :unprocessable_entity
    end
  end

  private

  def update_loaded_status
    current_user.company.order_headers.where(loaded: false).each do |order|
      order.loaded = true
      order.save
    end
  end

  def order_params(my_params)
    my_params.permit(
                                        :current_date,
                                        :delivery_date,
                                        :shop_asc,
                                        :comment,
                                        :sum,
                                        :with_docs,
                                        :wtf_code,
                                        :imei,
                                        :latitude,
                                        :longitude,
                                        :order_tables_attributes => [
                                                                :id,
                                                                :product_asc,
                                                                :price_list_id,
                                                                :count,
                                                                :cost,
                                                                :_destroy] )
  end
end
