class CompaniesController < ApplicationController
  authorize_resource

  before_action :set_company, except: [:new, :create]
  after_action  :add_id_to_user, only: :create

  def show; end

  def new
    if current_user.company.present?
      redirect_to root_path, alert: "У вас уже есть одна"
    else
      @company = Company.new
    end
  end

  def create
    @company = current_user.build_company(company_params)

    if @company.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @company.update(company_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def add_id_to_user
    current_user.company_id = @company.id
    current_user.save
  end

  def company_params
    params.require(:company).permit(:name)
  end
end
