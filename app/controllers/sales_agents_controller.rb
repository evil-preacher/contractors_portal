class SalesAgentsController < ApplicationController
  authorize_resource

  before_action :set_sales_agent, only: [:edit, :destroy]

  def index
    @sales_agents = current_user.company.sales_agents
  end

  def new
    @sales_agent = SalesAgent.new
  end

  def create
    @sales_agent = current_user.company.sales_agents.new(sales_agent_params)

    if @sales_agent.save
      redirect_to sales_agents_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @sales_agent.update
      redirect_to sales_agents_path
    else
      render :edit
    end
  end

  def destroy
    @sales_agent.destroy
    redirect_to sales_agents_path
  end

  private

  def set_sales_agent
    @sales_agent = SalesAgent.find(params[:id])
  end

  def sales_agent_params
    params.require(:sales_agent).permit(:name, :IMEI, :accounting_system_code)
  end
end
