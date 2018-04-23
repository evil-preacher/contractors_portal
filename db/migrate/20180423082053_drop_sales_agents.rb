class DropSalesAgents < ActiveRecord::Migration[5.1]
  def change
    drop_table :sales_agents
  end
end
