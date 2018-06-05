class AddPriceTypeIdToShops < ActiveRecord::Migration[5.1]
  def change
    add_belongs_to :shops, :price_type
    add_belongs_to :price_types, :company
  end
end
