class PriceTypesController < ApplicationController
  authorize_resource

  def index
    @price_types = current_user.company.price_types.paginate(page: params[:page], per_page: 15)
  end
end
