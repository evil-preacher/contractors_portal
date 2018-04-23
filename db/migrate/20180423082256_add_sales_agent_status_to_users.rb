class AddSalesAgentStatusToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :sales_agent, :boolean, default: false
  end
end
