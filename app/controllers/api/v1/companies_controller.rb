class Api::V1::CompaniesController < Api::V1::BaseController
  def show
    win = params[:win]
    if win.nil?
      render json: @company = current_user.company
    else
      @company = current_user.company
      @company.encode("windows-1251")
      render json: @company
    end
  end
end
