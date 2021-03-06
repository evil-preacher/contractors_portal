class Api::V1::PriceListsController < Api::V1::BaseController
  after_action :set_load_event, only: :create

  def index
    render json: @price_lists = current_user.company.price_lists
  end

  def create
    PriceList.where(company_id: current_user.company.id).delete_all
    @wrong_objects = []
    params["price_lists"].each do |key, value|
      if value[:price] && value[:price_type_asc] && value[:product_asc]
        @price_list = current_user.company.price_lists.create(price_list_params(value))
      else
        @wrong_objects << key
      end
    end
    if @wrong_objects.empty?
      render json: {success: 'Цены выгружены'}, status: :created
    else
      render json: {failed: "Цены не выгружены, некорректные данные: #{@wrong_objects}"}, status: :unprocessable_entity
      PriceList.where(company_id: current_user.company.id).delete_all
    end
  end

  private

  def price_list_params(my_params)
    my_params.permit(:price,
                     :load_event_id,
                     :company_id,
                     :price_type_asc,
                     :product_asc)
  end

  def set_load_event
    load_event = current_user.company.load_events.create(loading: DateTime.now)
    current_user.company.price_lists.each do |price|
      price.load_event_id = load_event.id if price.load_event_id.nil?
      price.save
    end
  end
end
