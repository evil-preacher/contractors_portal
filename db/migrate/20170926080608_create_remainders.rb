class CreateRemainders < ActiveRecord::Migration[5.1]
  def change
    create_table :remainders do |t|
      t.decimal :remainder, precision: 17, scale: 2
      t.references :company
      t.references :load_event
      t.references :product
      t.timestamps
    end
  end
end
