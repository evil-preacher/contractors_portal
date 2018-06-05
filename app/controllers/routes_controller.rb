class RoutesController < ApplicationController
  authorize_resource

  before_action :set_route, only: [:destroy]

  def index
    @routes = current_user.company.routes.paginate(page: params[:page], per_page: 15)
  end

  def new
    @route = current_user.company.routes.new
  end

  def create
    @route = current_user.company.routes.new(routes_params)

    if @route.save
      redirect_to routes_path, notice: 'Маршрут создан'
    else
      render :new
    end
  end

  def destroy
    @route.destroy
    redirect_to routes_path
  end

  private

  def set_route
    @route = Route.find(params[:id])
  end

  def routes_params
    params.require(:route).permit(:day_id,
                                  :index_number,
                                  :user_id,
                                  :shop_id)
  end
end
