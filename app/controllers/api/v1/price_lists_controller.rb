class Api::V1::PriceListsController < Api::V1::BaseController
  after_action :set_load_event, only: :create

  def index
    render json: @price_lists = current_user.company.price_lists
  end

  def create
    PriceList.where(company_id: current_user.company.id).delete_all
    params["price_lists"].each do |key, value|
      @price_list = current_user.company.price_lists.create(price_list_params(value))
    end
    if @price_list.save
      render json: {success: 'Заявки выгружены'}, status: :created
    else
      render json: {failed: 'Заявки не выгружены'}, status: :unprocessable_entity
    end
  end

  private

  def price_list_params(my_params)
    my_params.permit(:price, :load_event_id, :company_id, :price_type_accounting_system_code, :product_accounting_system_code)
  end

  def set_load_event
    load_event = current_user.company.load_events.create(loading: DateTime.now)
    current_user.company.price_lists.each do |price|
      price.load_event_id = load_event.id if price.load_event_id.nil?
      price.save
    end
  end
end
