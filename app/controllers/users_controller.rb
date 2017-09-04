class UsersController < ApplicationController
  before_action :set_user, only: :show

  authorize_resource

  def index
    @users = current_user.company.users.where(admin: false)
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

  private

  def user_params
    params.require(:user).permit(:name, :email, :office, :password,
                                 :password_confirmation, :confirmed_at,
                                 :company_id)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
