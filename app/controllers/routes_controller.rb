class RoutesController < ApplicationController
  authorize_resource

  def index
    @routes = current_user.company.routes
  end

  def new
    @route = current_user.company.routes.new
  end
end
