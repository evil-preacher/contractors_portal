class CreateOrderTableProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :order_table_products do |t|
      t.integer :order_table_id
      t.integer :product_id
      t.timestamps
    end
  end
end
