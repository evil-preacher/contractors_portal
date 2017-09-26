class CreateLoadEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :load_events do |t|
      t.references :company
      t.datetime :loading
      t.timestamps
    end
  end
end
