class AddCompanyIdToBrands < ActiveRecord::Migration[5.1]
  def change
    add_belongs_to :brands, :company
  end
end
