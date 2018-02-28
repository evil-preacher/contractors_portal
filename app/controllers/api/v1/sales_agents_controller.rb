class Api::V1::SalesAgentsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token

  def batch_create
    success = current_user.company.sales_agents.batch_create(request.raw_post)
    if success
      render json: {success: 'sales_agents added'}, status: :created
    else
      render json: {failed: 'sales_agents not added'}, status: :unprocessable_entity
    end
  end

  def clear_all
    current_user.company.sales_agents.clear_all
  end
end
