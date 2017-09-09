class CreatePriceTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :price_types do |t|
      t.string :accounting_system_code, null: false
      t.string :title, null: false
      t.timestamps
    end
  end
end
