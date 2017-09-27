class CreateShops < ActiveRecord::Migration[5.1]
  def change
    create_table :shops do |t|
      t.string  :accounting_system_code, null: false, limit: 20
      t.string  :title, null: false, limit: 20
      t.string  :address
      t.decimal :latitude, precision: 10, scale: 4
      t.decimal :longitude, precision: 10, scale: 4
      t.timestamps
    end
  end
end
