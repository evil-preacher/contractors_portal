class RemoveTitleLimit < ActiveRecord::Migration[5.1]
  def change
    change_column :categories, :title, :string, limit: 150
    change_column :brands, :title, :string, limit: 150
    change_column :shops, :title, :string, limit: 150
  end
end
