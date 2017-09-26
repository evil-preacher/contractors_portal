class RemaindersController < ApplicationController
  authorize_resource

  def index
    @remainders = current_user.company.remainders
  end

  def new
    @remainder = Remainder.new
  end

  def create
    @remainder = current_user.company.remainders.new(remainder_params)
    @load_event = current_user.company.load_events.create(loading: DateTime.now)
    @remainder.load_event_id = @load_event.id

    if @remainder.save
      redirect_to remainders_path
    else
      render :new
    end
  end

  private

  def remainder_params
    params.require(:remainder).permit(:remainder, :load_event_id, :product_id, :company_id)
  end
end
