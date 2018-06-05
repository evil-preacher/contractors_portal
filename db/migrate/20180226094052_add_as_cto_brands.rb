class AddAsCtoBrands < ActiveRecord::Migration[5.1]
  def change
    add_column :brands, :accounting_system_code, :string
  end
end
