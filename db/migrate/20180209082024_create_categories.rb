class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string     :accounting_system_code, null: false, limit: 20
      t.string     :title, null: false, limit: 50
      t.string     :parent_code, limit: 20
      t.references :company
      t.timestamps
    end
  end
end
