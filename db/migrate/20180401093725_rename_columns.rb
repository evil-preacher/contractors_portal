class RenameColumns < ActiveRecord::Migration[5.1]
  def change
    rename_column :brands, :accounting_system_code, :asc
    rename_column :categories, :accounting_system_code, :asc
    rename_column :price_lists, :price_type_accounting_system_code, :price_type_asc
    rename_column :price_lists, :product_accounting_system_code, :product_asc
    rename_column :price_types, :accounting_system_code, :asc
    rename_column :products, :accounting_system_code, :asc
    rename_column :products, :category_accounting_system_code, :category_asc
    rename_column :products, :brand_accounting_system_code, :brand_asc
    rename_column :remainders, :product_accounting_system_code, :product_asc
    rename_column :sales_agents, :accounting_system_code, :asc
    rename_column :shops, :accounting_system_code, :asc
    rename_column :shops, :price_type_accounting_system_code, :price_type_asc
  end
end
