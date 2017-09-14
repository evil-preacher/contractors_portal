class BrandsController < ApplicationController
  authorize_resource

  before_action :set_brand, except: [:index, :new, :create]

  def index
    @brands = current_user.company.brands
  end

  def new
    @brand = Brand.new
  end

  def create
    @brand = current_user.company.brand.new(brand_params)

    if @brand.save
      redirect_to brands_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @brand.update(brand_params)
      redirect_to brands_path
    else
      render :edit
    end
  end

  private

  def set_brand
    @brand = Brand.find(params[:id])
  end

  def brand_params
    params.require(:brand).permit(:title)
  end
end
