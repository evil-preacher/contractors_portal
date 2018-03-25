class Api::V1::RemaindersController < Api::V1::BaseController
  after_action :set_load_event, only: :create

  def index
    render json: @remainders = current_user.company.remainders
  end

  def create
    params["remainders"].each do |key, value|
      @remainder = current_user.company.remainders.create(remainder_params(value))
    end
    if @remainder.save
      render json: {success: 'Заявки выгружены'}, status: :created
    else
      render json: {failed: 'Заявки не выгружены'}, status: :unprocessable_entity
    end
  end

  private

  def remainder_params(my_params)
    my_params.permit(:remainder, :company_id, :load_event_id, :product_accounting_system_code)
  end

  def set_load_event
    load_event = current_user.company.load_events.create(loading: DateTime.now)
    current_user.company.remainders.each do |remainder|
      remainder.load_event_id = load_event.id if remainder.load_event_id.nil?
      remainder.save
    end
  end
end
