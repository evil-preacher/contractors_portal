class UsersController < ApplicationController
  authorize_resource

  before_action :set_user, only: [:show, :destroy]

  def index
    @users = current_user.company.users.where(admin: false).paginate(page: params[:page], per_page: 15)
  end

  def sales_agents
    @users = current_user.company.users.where(sales_agent: true).paginate(page: params[:page], per_page: 15)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :confirmed_at,
                                 :company_id, :sales_agent)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
