class ProductGroupsController < ApplicationController
  authorize_resource

  before_action :set_product_group, only: [:edit, :update, :destroy]

  def index
    @product_groups = current_user.company.product_groups
  end

  def new
    @product_group = ProductGroup.new
  end

  def create
    @product_group = current_user.company.product_groups.build(product_group_params)

    if @product_group.save
      redirect_to product_groups_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @product_group.update(product_group_params)
      redirect_to product_groups_path
    else
      render :edit
    end
  end

  def destroy
    unless @product_group.destroy
      flash[:notice] = @product_group.errors.full_messages[0]
    end
    redirect_to product_groups_path
  end

  private

  def set_product_group
    @product_group = ProductGroup.find(params[:id])
  end

  def product_group_params
    params.require(:product_group).permit(:title, :product_type_id, :company_id)
  end
end
