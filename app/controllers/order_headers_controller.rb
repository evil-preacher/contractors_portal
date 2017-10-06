class OrderHeadersController < ApplicationController
  authorize_resource

  before_action :set_order_header, only: [:show, :edit, :update, :destroy]
  before_action :set_order_table, only: :show

  def index
    @order_headers = current_user.company.order_headers
  end

  def show; end

  def new
    @order_header = OrderHeader.new
  end

  def create
    @order_header = current_user.company.order_headers.new(order_header_params)

    if @order_header.save
      redirect_to new_order_table_path
    else
      render :new
    end
  end

  def edit
    if @order_header.loaded
      flash[:alert] = "Заявка уже загружена в учётную систему"
      redirect_to order_headers_path
    end
  end

  def update
    if @order_header.update(order_header_params)
      redirect_to order_headers_path
    else
      render :edit
    end
  end

  def destroy
    @order_header.destroy
    redirect_to order_headers_path
  end

  private

  def set_order_header
    @order_header = OrderHeader.find(params[:id])
  end

  def set_order_table
    @order_table = @order_header.order_tables
  end

  def order_header_params
    params.require(:order_header).permit(:accounting_system_code, :loaded,
                                         :current_date, :delivery_date, :shop_id,
                                         :comment, :sum, :with_docs, :wtf_code,
                                         :imei, :company_id)
  end
end
