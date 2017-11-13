class Api::V1::RemaindersController < Api::V1::BaseController
  def index
    render json: @remainders = current_user.company.remainders
  end
end
