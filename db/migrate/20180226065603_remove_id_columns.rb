class RemoveIdColumns < ActiveRecord::Migration[5.1]
  def change
    remove_column :price_lists, :price_type_id, :bigint
    remove_column :price_lists, :product_id, :bigint
    remove_column :products, :brand_id, :bigint
    remove_column :remainders, :product_id, :bigint
    remove_column :shops, :price_type_id, :bigint
  end
end
