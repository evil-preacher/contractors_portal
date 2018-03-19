class Api::V1::OrderHeadersController < Api::V1::BaseController
  def create
    @order_header = current_user.company.order_headers.new(params.require(:order_header).permit(:current_date, :delivery_date, :shop_id, :comment, :sum, :with_docs, :wtf_code, :imei ))
    # @order_header.order_tables.build

    if @order_header.save!
      # @order_header.order_tables.save
      render json: {success: 'Заявки загружены'}, status: :created
    else
      render json: {failed: 'Заявки не загружены'}, status: :unprocessable_entity
    end
  end
end
