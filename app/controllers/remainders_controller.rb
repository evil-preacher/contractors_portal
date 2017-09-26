class RemaindersController < ApplicationController
  authorize_resource

  before_action :create_load_event, only: :create

  def index
    @remainders = current_user.load_events.remainders
  end

  def new
    @remainder = Remainder.new
  end

  def create
    @remainder = @load_event.remainders.new(remainder_params)

    if @remainder.save
      redirect_to remainders_path
    else
      render :new
    end
  end

  private

  def remainder_params
    params.require(:remainder).permit(:remainder, :load_event_id, :product_id)
  end

  def create_load_event
    @load_event = current_user.company.load_events.create(loading: DateTime.now)
  end
end
