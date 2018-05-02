class AddDaysReferenceToRoutes < ActiveRecord::Migration[5.1]
  def change
    remove_column :routes, :day, :string
    add_reference :routes, :day, foreign_key: true
  end
end
