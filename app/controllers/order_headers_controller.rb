class OrderHeadersController < ApplicationController
  authorize_resource

  before_action :set_order_header, only: [:edit, :update, :destroy]

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
      redirect_to order_headers_path
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
    unless @order_header.destroy
      flash[:notice] = @order_header.errors.full_messages[0]
    end
    redirect_to order_headers_path
  end

  private

  def set_order_header
    @order_header = OrderHeader.find(params[:id])
  end

  def order_header_params
    params.require(:order_header).permit(:accounting_system_code, :loaded,
                                         :current_date, :delivery_date, :shop_id,
                                         :comment, :sum, :with_docs, :wtf_code,
                                         :imei, :company_id)
  end
end
