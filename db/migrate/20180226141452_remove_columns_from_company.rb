class RemoveColumnsFromCompany < ActiveRecord::Migration[5.1]
  def change
    remove_column :companies, :bin, :string
    remove_column :companies, :phone, :string
    remove_column :companies, :address, :string
  end
end
