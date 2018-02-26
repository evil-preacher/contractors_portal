class CategoriesController < ApplicationController

  authorize_resource

  def index
    @categories = current_user.company.categories
  end
end
