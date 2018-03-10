class Api::V1::SalesAgentsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token

  def batch_create
    SalesAgent.where(company_id: current_user.company.id).delete_all
    success = current_user.company.sales_agents.batch_create(request.raw_post)
    if success
      render json: {success: 'Торговые агенты добавлены'}, status: :created
    else
      render json: {failed: 'Торговые агенты не добавлены'}, status: :unprocessable_entity
    end
  end
end
