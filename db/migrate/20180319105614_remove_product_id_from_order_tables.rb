class RemoveProductIdFromOrderTables < ActiveRecord::Migration[5.1]
  def change
    remove_column :order_tables, :product_id, :bigint
    add_column    :order_tables, :product_asc, :string
  end
end
