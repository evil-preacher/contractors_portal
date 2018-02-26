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

    if @remainder.save
      @load_event = current_user.company.load_events.create(loading: DateTime.now)
      @remainder.load_event_id = @load_event.id
      @remainder.save

      redirect_to remainders_path
    else
      render :new
    end
  end

  private

  def remainder_params
    params.require(:remainder).permit(:remainder, :load_event_id, :product_accounting_system_code, :company_id)
  end
end
