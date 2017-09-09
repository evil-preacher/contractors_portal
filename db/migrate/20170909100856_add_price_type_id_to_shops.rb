class AddPriceTypeIdToShops < ActiveRecord::Migration[5.1]
  def change
    add_belongs_to :shops, :price_type
  end
end
