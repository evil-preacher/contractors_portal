class CreateProductTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :product_types do |t|
      t.string :title, null: false, limit: 50
      t.references :company
      t.timestamps
    end
  end
end
