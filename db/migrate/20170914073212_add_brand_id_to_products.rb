class AddBrandIdToProducts < ActiveRecord::Migration[5.1]
  def change
    add_belongs_to :products, :brand
  end
end
