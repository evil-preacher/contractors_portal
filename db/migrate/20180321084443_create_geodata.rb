class CreateGeodata < ActiveRecord::Migration[5.1]
  def change
    create_table :geodata do |t|
      t.decimal :latitude
      t.decimal :longitude
      t.datetime :time
      t.string :sales_agent_asc
      t.references :company

      t.timestamps
    end
  end
end
