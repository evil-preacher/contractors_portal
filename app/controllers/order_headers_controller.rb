class OrderHeadersController < ApplicationController
  authorize_resource

  before_action :set_order_header, only: [:show, :edit, :update, :destroy]
  before_action :set_order_table, only: :show

  def index
    @order_headers = current_user.company.order_headers
  end

  def show; end

  private

  def set_order_header
    @order_header = OrderHeader.find(params[:id])
  end

  def set_order_table
    @order_table = @order_header.order_tables
  end
end
