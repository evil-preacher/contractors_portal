class Product < ApplicationRecord
  belongs_to :product_group
  belongs_to :product_type
  belongs_to :company
end
