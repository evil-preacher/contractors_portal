class AddEmailToLoadHeaders < ActiveRecord::Migration[5.1]
  def change
    remove_column :order_headers, :imei,  :string
    add_column    :order_headers, :email, :string
  end
end
