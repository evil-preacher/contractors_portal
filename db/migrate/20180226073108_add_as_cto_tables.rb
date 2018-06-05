class AddAsCtoTables < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :category_accounting_system_code, :string
    add_index  :products, :category_accounting_system_code
  end
end
