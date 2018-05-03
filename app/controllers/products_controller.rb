class ProductsController < ApplicationController
  authorize_resource

  before_action :set_product, only: :show

  def index
    @products = current_user.company.products.paginate(page: params[:page], per_page: 15)
  end

  def show; end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end
