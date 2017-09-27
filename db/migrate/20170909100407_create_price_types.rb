class CreatePriceTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :price_types do |t|
      t.string :accounting_system_code, null: false, limit: 20
      t.string :title, null: false, limit: 50
      t.timestamps
    end
  end
end
