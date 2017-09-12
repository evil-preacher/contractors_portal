class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :accounting_system_code, null: false
      t.string :title, null: false
      t.string :barcode, null: false
      t.references :product_type
      t.references :product_group
      t.references :company
      t.timestamps
    end
  end
end
