class Api::V1::OrderHeadersController < Api::V1::BaseController
  def index
    load_date = params[:load_date]
    load_date = Date.parse(load_date)
    render json: @orders = current_user.company.order_headers.includes(:order_tables)
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

  def mark_order
    @order = OrderHeader.find(params[:id])
    @order.loaded = true
    if @order.save
      render json: { success: 'Статус обновлён'}, status: :created
      else
       render json: {failed: 'Статус не обновлён'}, status: :unprocessable_entity
     end
   end

  private

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
                                                                :price,
                                                                :count,
                                                                :cost,
                                                                :_destroy] )
  end
end
