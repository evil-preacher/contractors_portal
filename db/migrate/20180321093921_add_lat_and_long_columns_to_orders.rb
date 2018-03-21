class AddLatAndLongColumnsToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :order_headers, :latitude, :decimal
    add_column :order_headers, :longitude, :decimal
  end
end
