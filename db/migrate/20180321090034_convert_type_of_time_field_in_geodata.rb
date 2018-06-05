class ConvertTypeOfTimeFieldInGeodata < ActiveRecord::Migration[5.1]
  def change
    change_column :geodata, :time, :string
  end
end
