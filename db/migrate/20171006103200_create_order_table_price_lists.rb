class CreateOrderTablePriceLists < ActiveRecord::Migration[5.1]
  def change
    create_table :order_table_price_lists do |t|
      t.integer :order_table_id
      t.integer :price_list_id
      t.timestamps
    end
  end
end
