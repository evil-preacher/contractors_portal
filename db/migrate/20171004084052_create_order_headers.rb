class CreateOrderHeaders < ActiveRecord::Migration[5.1]
  def change
    create_table :order_headers do |t|
      t.string     :accounting_system_code, null: false, limit: 20
      t.boolean    :loaded, default: false
      t.datetime   :current_date, null: false
      t.datetime   :delivery_date
      t.references :shop, null: false
      t.string     :comment
      t.decimal    :sum, default: 0
      t.boolean    :with_docs, default: false
      t.string     :wtf_code
      t.string     :imei, null: false, limit: 20
      t.references :company, null: false
      t.timestamps
    end
  end
end
