class Api::V1::OrderHeadersController < Api::V1::BaseController
  def create
    @order_header = current_user.company.order_headers.new(order_params)
    pry

    if @order_header.save
      render json: {success: 'Заявки загружены'}, status: :created
    else
      render json: {failed: 'Заявки не загружены'}, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_header).permit(
                                        :current_date,
                                        :delivery_date,
                                        :shop_asc,
                                        :comment,
                                        :sum,
                                        :with_docs,
                                        :wtf_code,
                                        :imei,
                                        :order_tables_attributes => [
                                                                :id,
                                                                :product_asc,
                                                                :price_list_id,
                                                                :count,
                                                                :cost,
                                                                :_destroy] )
  end
end
