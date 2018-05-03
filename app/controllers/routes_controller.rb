class RoutesController < ApplicationController
  authorize_resource

  def index
    @routes = current_user.company.routes.paginate(page: params[:page], per_page: 20)
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

  private

  def routes_params
    params.require(:route).permit(:day_id,
                                  :index_number,
                                  :user_id,
                                  :shop_id)
  end
end
