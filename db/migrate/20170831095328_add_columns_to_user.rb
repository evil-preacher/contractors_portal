class AddColumnsToUser < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.string :name, null: false
      t.boolean :admin, default: false
    end
  end
end
