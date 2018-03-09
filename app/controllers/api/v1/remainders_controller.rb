class Api::V1::RemaindersController < Api::V1::BaseController
  after_action :set_load_event, only: :batch_create

  def index
    render json: @remainders = current_user.company.remainders
  end

  def batch_create
    success = current_user.company.remainders.batch_create(request.raw_post)
    if success
      render json: {success: 'Остатки добавлены'}, status: :created
    else
      render json: {failed: 'Остатки не добавлены'}, status: :unprocessable_entity
    end
  end

  def clear_all
    current_user.company.remainders.clear_all
  end

  private

  def set_load_event
    load_event = current_user.company.load_events.create(loading: DateTime.now)
    current_user.company.remainders.each do |remainder|
      remainder.load_event_id = load_event.id if remainder.load_event_id.nil?
      remainder.save
    end
  end
end
