class PriceTypesController < ApplicationController
  authorize_resource

  def index
    @price_types = current_user.company.price_types
  end
end
