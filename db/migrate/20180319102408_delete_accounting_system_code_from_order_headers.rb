class DeleteAccountingSystemCodeFromOrderHeaders < ActiveRecord::Migration[5.1]
  def change
    remove_column :order_headers, :accounting_system_code, :string
    remove_column :order_headers, :shop_id, :bigint
    add_column    :order_headers, :shop_asc, :string
    change_column :order_headers, :current_date, :string
    change_column :order_headers, :delivery_date, :string
  end
end
