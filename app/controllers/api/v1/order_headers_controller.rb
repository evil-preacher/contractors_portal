class Api::V1::OrderHeadersController < Api::V1::BaseController
  def index
    render json: @orders = current_user.company.order_headers.includes(:order_tables).where(loaded: false)
  end

  def create
    params["orders"].each do |key, value|
      if current_user.company.order_headers.where("wtf_code = ? AND loaded = ?", value[:wtf_code], false).present?
        @order_header = current_user.company.order_headers.where("wtf_code = ? AND loaded = ?", value[:wtf_code], false).first
        @order_header.order_tables.delete_all
        @order_header.update(order_params(value))
      else
        @order_header = current_user.company.order_headers.create(order_params(value))
        @order_header.email = current_user.email
        @order_header.save
      end
    end
    if @order_header.save || @order_header.update
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
                                        :email,
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
