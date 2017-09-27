class CreateSalesAgents < ActiveRecord::Migration[5.1]
  def change
    create_table :sales_agents do |t|
      t.string :accounting_system_code, null: false, limit: 20
      t.string :IMEI, null: false, limit: 20
      t.string :name, null: false, limit: 50
      t.references :company
      t.timestamps
    end
  end
end
