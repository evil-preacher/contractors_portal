class SearchesController < ApplicationController
  authorize_resource

  def new
    @search = Search.new
  end

  def create
    @search = Search.create(search_params)
    if @search.save
      redirect_to @search
    else
      render :new
      flash[:notice] = @search.errors.full_messages[0]
    end
  end

  def show
    @search = Search.find(params[:id])
  end

  private

  def search_params
    params.require(:search).permit(:keywords, :product_type_id, :product_group_id, :brand_id)
  end
end
