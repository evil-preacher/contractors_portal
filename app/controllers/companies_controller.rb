class CompaniesController < ApplicationController
  authorize_resource

  before_action :set_company, except: [:new, :create]

  def show; end

  def new
    @company = Company.new
  end

  def create
    @company = current_user.company.new(company_params)

    if @company.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @company.update
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :bin, :phone, :address)
  end
end
