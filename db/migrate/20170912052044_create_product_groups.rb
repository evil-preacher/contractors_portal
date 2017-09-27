class CreateProductGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :product_groups do |t|
      t.string :title, null: false, limit: 50
      t.references :product_type
      t.references :company
      t.timestamps
    end
  end
end
