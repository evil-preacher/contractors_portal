class Api::V1::CompaniesController < Api::V1::BaseController
  def show
      render json: @company = current_user.company
  end
end
