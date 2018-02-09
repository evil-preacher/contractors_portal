class CategoriesController < ApplicationController
  include CategoriesHelper

  authorize_resource

  before_action :set_category, except: [:index, :new, :create]

  def index
    @categories = current_user.company.categories
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.company.categories.new(category_params)

    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      redirect_to categories_path
    else
      render :edit
    end
  end

  def destroy
    unless @category.destroy
      flash[:notice] = @category.errors.full_messages[0]
    end
    redirect_to categories_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:accounting_system_code, :title, :parent_code)
  end
end
