class AddProductAscToPriceList < ActiveRecord::Migration[5.1]
  def change
    add_column :price_lists, :product_accounting_system_code, :string
    add_index  :price_lists, :product_accounting_system_code
  end
end
