class Api::V1::SalesAgentsController < Api::V1::BaseController
  around_action :wrap_in_transaction, only: :create

  def create
    params["sales_agents"].each do |key, value|
      @sales_agent = current_user.company.sales_agents.create(sales_agent_params(value))
    end
    if @sales_agent.save
      render json: {success: 'Заявки выгружены'}, status: :created
    else
      render json: {failed: 'Заявки не выгружены'}, status: :unprocessable_entity
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

  def sales_agent_params(my_params)
    my_params.permit(:accounting_system_code, :IMEI, :name, :company_id)
  end
end
