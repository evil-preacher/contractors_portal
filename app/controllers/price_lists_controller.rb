class PriceListsController < ApplicationController
  authorize_resource

  def index
    @price_lists = current_user.company.price_lists
  end
end
