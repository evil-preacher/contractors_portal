class AddCompanyIdToShops < ActiveRecord::Migration[5.1]
  def change
    add_belongs_to :shops, :company
  end
end
