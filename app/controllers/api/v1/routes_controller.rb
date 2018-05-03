class Api::V1::RoutesController < Api::V1::BaseController
  def index
    render json: @routes = current_user.company.routes.where(user_id: current_user.id)
  end
end
