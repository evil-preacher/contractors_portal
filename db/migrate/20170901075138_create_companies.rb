class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :bin, null: false, length: 12
      t.string :phone, null: false, limit: 20
      t.string :address, null: false
      t.timestamps
    end
  end
end
