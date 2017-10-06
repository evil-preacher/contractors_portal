class OrderTablesController < ApplicationController
  authorize_resource

  before_action :set_order_header

  def new
    @order_table = @order_header.order_tables.new
  end

  def create
    @order_table = @order_header.order_tables.new(order_table_params)

    if @order_table.save
      @order_header.sum = @order_table.cost
      @order_header.save
      redirect_to order_headers_path
    else
      render :new
    end
  end

  private

  def set_order_header
    @order_header = OrderHeader.last
  end

  def order_table_params
    params.require(:order_table).permit(:order_header_id, :product_id, :count,
                                        :cost, :price_list_id)
  end
end
