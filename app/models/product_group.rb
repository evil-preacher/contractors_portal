class ProductGroup < ApplicationRecord
  has_many   :products
  belongs_to :product_type
  belongs_to :company
end
