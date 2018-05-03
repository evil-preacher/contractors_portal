class CategoriesController < ApplicationController

  authorize_resource

  def index
    @categories = current_user.company.categories.paginate(page: params[:page], per_page: 15)
  end
end
