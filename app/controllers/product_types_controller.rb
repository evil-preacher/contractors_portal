class ProductTypesController < ApplicationController
  authorize_resource

  before_action :set_product_type, only: [:edit, :update, :destroy]

  def index
    @product_types = current_user.company.product_types
  end

  def new
    @product_type = ProductType.new
  end

  def create
    @product_type = current_user.company.product_types.new(product_type_params)

    if @product_type.save
      redirect_to product_types_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @product_type.update(product_type_params)
      redirect_to product_types_path
    else
      render :edit
    end
  end

  def destroy
    unless @product_type.destroy
      flash[:notice] = @product_type.errors.full_messages[0]
    end
    redirect_to product_types_path
  end

  private

  def set_product_type
    @product_type = ProductType.find(params[:id])
  end

  def product_type_params
    params.require(:product_type).permit(:title)
  end
end
