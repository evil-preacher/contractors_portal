class AddOfficeToUsers < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.string :office
    end
  end
end
