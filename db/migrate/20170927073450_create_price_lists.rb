class CreatePriceLists < ActiveRecord::Migration[5.1]
  def change
    create_table :price_lists do |t|
      t.references :company
      t.references :price_type
      t.references :product
      t.references :load_event
      t.decimal    :price, null: false, precision: 17, scale: 2
      t.timestamps
    end
  end
end
