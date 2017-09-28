class PriceListsController < ApplicationController
  authorize_resource

  before_action :set_price_list, only: :destroy

  def index
    @price_lists = current_user.company.price_lists
  end

  def new
    @price_list = PriceList.new
  end

  def create
    @price_list = PriceList.new(price_list_params)

    if @price_list.save
      @load_event = current_user.company.load_events.create(loading: DateTime.now)
      @price_list.load_event_id = @load_event.id
      @price_list.save

      redirect_to price_lists_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @price_list.update(price_list_params)
      redirect_to price_lists_path
    else
      render :edit
    end
  end

  def destroy
    @price_list.destroy
    redirect_to price_lists_path
  end

  private

  def price_list_params
    params.require(:price_list).permit( :company_id, :price_type_id, :product_id, :load_event_id, :price )
  end

  def set_price_list
    @price_list = PriceList.find(params[:id])
  end
end
