class Api::V1::PriceListsController < Api::V1::BaseController
  after_action :set_load_event, only: :batch_create

  def index
    render json: @price_lists = current_user.company.price_lists
  end

  def batch_create
    PriceList.where(company_id: current_user.company.id).delete_all
    success = current_user.company.price_lists.batch_create(request.raw_post)
    if success
      render json: {success: 'Цены добавлены'}, status: :created
    else
      render json: {failed: 'Цены не добавлены'}, status: :unprocessable_entity
    end
  end

  private

  def set_load_event
    load_event = current_user.company.load_events.create(loading: DateTime.now)
    current_user.company.price_lists.each do |price|
      price.load_event_id = load_event.id if price.load_event_id.nil?
      price.save
    end
  end
end
