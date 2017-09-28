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
    @brand = current_user.company.brands.new(brand_params)

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

  def destroy
    unless @brand.destroy
      flash[:notice] = @brand.errors.full_messages[0]
    else
      redirect_to brands_path
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
