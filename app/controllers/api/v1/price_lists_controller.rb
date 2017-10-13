class Api::V1::PriceListsController < Api::V1::BaseController
  def index
    render json: @price_lists = current_user.company.price_lists
  end
end
