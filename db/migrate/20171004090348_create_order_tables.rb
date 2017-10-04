class CreateOrderTables < ActiveRecord::Migration[5.1]
  def change
    create_table :order_tables do |t|
      t.references :order_header
      t.references :product
      t.references :price_list
      t.decimal    :count, null: false
      t.decimal    :cost, null: false
      t.timestamps
    end
  end
end
