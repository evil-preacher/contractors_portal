class ShopsController < ApplicationController
  authorize_resource

  def index
    @shops = current_user.company.shops.paginate(page: params[:page], per_page: 20)
  end
end
