class CreateBrands < ActiveRecord::Migration[5.1]
  def change
    create_table :brands do |t|
      t.string :title, null: false, limit: 20
      t.timestamps
    end
  end
end
