class Api::V1::RoutesController < Api::V1::BaseController
  def index
    render json: @routes = current_user.company.routes.where(sale_agent_asc: current_user.accounting_system_code)
  end

  def create
    params["routes"].each do |key, value|
      @route = current_user.company.routes.create(order_params(value))
    end
    if @route.save
      render json: {success: 'Маршруты выгружены'}, status: :created
    else
      render json: {failed: 'Маршруты не выгружены'}, status: :unprocessable_entity
    end
  end

  private

  def order_params(my_params)
    my_params.permit( :sale_agent_asc,
                      :shop_asc,
                      :day,
                      :index_number )
  end
end
