class AddPriceTypeAscToShop < ActiveRecord::Migration[5.1]
  def change
    add_column :shops, :price_type_accounting_system_code, :string
    add_index  :shops, :price_type_accounting_system_code
  end
end
