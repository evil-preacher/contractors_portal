class ChangeRoutes < ActiveRecord::Migration[5.1]
  def change
    remove_column :routes, :sale_agent_asc, :string
    add_reference :routes, :user, foreign_key: true
    remove_column :routes, :shop_asc, :string
    add_reference :routes, :shop, foreign_key: true
    change_column :routes, :day, :string
  end
end
