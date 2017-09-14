class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.string :keywords
      t.integer :product_type_id
      t.integer :product_group_id
      t.integer :brand_id
      t.timestamps
    end
  end
end
