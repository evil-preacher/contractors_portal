class PriceTypesController < ApplicationController
  authorize_resource

  before_action :set_price_type, only: [:edit, :update, :destroy]

  def index
    @price_types = current_user.company.price_types
  end

  def new
    @price_type = PriceType.new
  end

  def create
    @price_type = current_user.company.price_types.new(price_type_params)

    if @price_type.save
      redirect_to price_types_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @price_type.update(price_type_params)
      redirect_to price_types_path
    else
      render :edit
    end
  end

  def destroy
    unless @price_type.destroy
      flash[:notice] = @price_type.errors.full_messages[0]
    end
    redirect_to price_types_path
  end

  private

  def set_price_type
    @price_type = PriceType.find(params[:id])
  end

  def price_type_params
    params.require(:price_type).permit(:title, :accounting_system_code)
  end
end
