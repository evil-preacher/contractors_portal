class AddProductAsCtoRemainders < ActiveRecord::Migration[5.1]
  def change
    add_column :remainders, :product_accounting_system_code, :string
    add_index  :remainders, :product_accounting_system_code
  end
end
