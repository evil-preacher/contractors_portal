class PriceListsController < ApplicationController
  authorize_resource

  def index
    @price_lists = current_user.company.price_lists.paginate(page: params[:page], per_page: 15)
  end
end
