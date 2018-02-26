class AddBrandAsCtoProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :brand_accounting_system_code, :string
    add_index  :products, :brand_accounting_system_code
  end
end
