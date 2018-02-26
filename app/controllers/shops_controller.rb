class ShopsController < ApplicationController
  authorize_resource

  def index
    @shops = current_user.company.shops
  end
end
