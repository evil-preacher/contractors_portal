class BrandsController < ApplicationController
  authorize_resource

  before_action :set_brand, except: [:index, :new, :create]

  def index
    @brands = current_user.company.brands
  end
end
