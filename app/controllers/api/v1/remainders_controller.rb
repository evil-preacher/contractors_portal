class Api::V1::RemaindersController < Api::V1::BaseController
  after_action :set_load_event, only: :create

  def index
    render json: @remainders = current_user.company.remainders
  end

  def create
    Remainder.where(company_id: current_user.company.id).delete_all
    @wrong_objects = []
    params["remainders"].each do |key, value|
      if value[:remainder] && value[:product_asc]
        @remainder = current_user.company.remainders.create(remainder_params(value))
      else
        @wrong_objects << key
      end
    end
    if @wrong_objects.empty?
      render json: {success: 'Остатки выгружены'}, status: :created
    else
      render json: {failed: "Остатки не выгружены, некорректные данные: #{@wrong_objects}"}, status: :unprocessable_entity
      Remainder.where(company_id: current_user.company.id).delete_all
    end
  end

  private

  def remainder_params(my_params)
    my_params.permit(:remainder,
                     :company_id,
                     :load_event_id,
                     :product_asc)
  end

  def set_load_event
    load_event = current_user.company.load_events.create(loading: DateTime.now)
    current_user.company.remainders.each do |remainder|
      remainder.load_event_id = load_event.id if remainder.load_event_id.nil?
      remainder.save
    end
  end
end
