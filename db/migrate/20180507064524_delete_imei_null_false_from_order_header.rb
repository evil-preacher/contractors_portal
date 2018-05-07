class DeleteImeiNullFalseFromOrderHeader < ActiveRecord::Migration[5.1]
  def change
    change_column :order_headers, :imei, :string, null: true
  end
end
