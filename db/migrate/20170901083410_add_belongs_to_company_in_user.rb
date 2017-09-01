class AddBelongsToCompanyInUser < ActiveRecord::Migration[5.1]
  def change
    add_belongs_to :users, :company
  end
end
