class LoadEventsController < ApplicationController
  authorize_resource

  before_action :set_load_event, only: :show

  def index
    @load_events = current_user.company.load_events
  end

  def show; end

  def new
    @load_event = LoadEvent.new
  end

  def create
    @load_event = current_user.company.load_events.new(load_event_params)
  end

  private

  def load_event_params
    params.require(:load_event).permit(:loading, :company_id)
  end

  def set_load_event
    @load_event = LoadEvent.find(params: [:id])
  end
end
