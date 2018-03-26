class Api::V1::RoutesController < Api::V1::BaseController
  around_action :wrap_in_transaction, only: :create

  def index
    render json: @routes = current_user.company.routes.where(sale_agent_asc: current_user.accounting_system_code)
  end

  def create
    Route.where(company_id: current_user.company.id).delete_all
    params["routes"].each do |key, value|
      @route = current_user.company.routes.create(route_params(value))
    end
    if @route.save
      render json: {success: 'Маршруты выгружены'}, status: :created
    else
      render json: {failed: 'Маршруты не выгружены'}, status: :unprocessable_entity
    end
  end

  private

  def wrap_in_transaction
    ActiveRecord::Base.transaction do
      begin
        yield
      ensure
        raise ActiveRecord::Rollback
      end
    end
  end

  def route_params(my_params)
    my_params.permit( :sale_agent_asc,
                      :shop_asc,
                      :day,
                      :index_number )
  end
end
