class Api::V1::SalesAgentsController < Api::V1::BaseController
  def create
    SalesAgent.where(company_id: current_user.company.id).delete_all
    @wrong_objects = []
    params["sales_agents"].each do |key, value|
      if value[:asc] && value[:IMEI] && value[:name]
        @sales_agent = current_user.company.sales_agents.create(sales_agent_params(value))
      else
        @wrong_objects << key
      end
    end
    if @wrong_objects.empty?
      render json: {success: 'Торговые агенты выгружены'}, status: :created
    else
      render json: {failed: "Торговые агенты не выгружены, некорректные данные: #{@wrong_objects}"}, status: :unprocessable_entity
      SalesAgent.where(company_id: current_user.company.id).delete_all
    end
  end

  private

  def sales_agent_params(my_params)
    my_params.permit(:accounting_system_code,
                     :IMEI,
                     :name,
                     :company_id)
  end
end
