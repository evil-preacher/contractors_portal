class ShopsController < ApplicationController
  authorize_resource

  before_action :set_shop, only: [:edit, :update, :destroy]

  def index
    @shops = current_user.company.shops
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = current_user.company.shops.new(shop_params)

    if @shop.save
      redirect_to shops_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @shop.update(shop_params)
      redirect_to shops_path
    else
      render :edit
    end
  end

  def destroy
    @shop.destroy
    redirect_to shops_path
  end

  private

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def shop_params
    params.require(:shop).permit(:title, :address, :longitude, :latitude,
                                 :accounting_system_code)
  end
end
