class Api::V1::RoutesController < Api::V1::BaseController
  def index
    render json: @routes = current_user.routes
  end
end
