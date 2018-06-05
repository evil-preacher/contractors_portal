class ChangeProductTitleLength < ActiveRecord::Migration[5.1]
  def change
    change_column :products, :title, :string, limit: 150
  end
end
