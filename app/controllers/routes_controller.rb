class RoutesController < ApplicationController
  authorize_resource

  def index
    @routes = current_user.company.routes
  end
end
