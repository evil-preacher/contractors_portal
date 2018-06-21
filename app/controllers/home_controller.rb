class HomeController < ApplicationController

  def show
    @categories = current_user.company.categories.count
    @products = current_user.company.products.count
    @shops = current_user.company.shops.count
    @orders = current_user.company.order_headers.count
    @orders_loaded = current_user.company.order_headers.where(loaded: true).count
    @users = current_user.company.users.where(sales_agent: true).count
  end
end
