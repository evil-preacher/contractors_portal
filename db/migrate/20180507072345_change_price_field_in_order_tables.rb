class ChangePriceFieldInOrderTables < ActiveRecord::Migration[5.1]
  def change
    remove_column :order_tables, :price_list_id, :bigint
    add_column    :order_tables, :price, :decimal
  end
end
