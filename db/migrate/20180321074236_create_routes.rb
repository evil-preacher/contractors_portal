class CreateRoutes < ActiveRecord::Migration[5.1]
  def change
    create_table :routes do |t|
      t.string :sale_agent_asc
      t.string :shop_asc
      t.integer :day
      t.integer :index_number
      t.references :company
      t.timestamps
    end
  end
end
