class BrandsController < ApplicationController
  authorize_resource

  def index
    @brands = current_user.company.brands.paginate(page: params[:page], per_page: 15)
  end
end
