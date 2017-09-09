class CreateSalesAgents < ActiveRecord::Migration[5.1]
  def change
    create_table :sales_agents do |t|
      t.string :accounting_system_code, null: false
      t.string :IMEI, null: false
      t.string :name, null: false
      t.references :company
      t.timestamps
    end
  end
end
