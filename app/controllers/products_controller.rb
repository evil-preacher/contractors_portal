class ProductsController < ApplicationController
  authorize_resource

  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = current_user.company.products
  end

  def show; end

  def new
    @product = Product.new(product_group_id: params[:product_group_id])
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :accounting_system_code, :barcode, :product_group_id, :company_id)
  end
end