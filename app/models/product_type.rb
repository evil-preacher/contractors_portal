class ProductType < ApplicationRecord
  has_many :product_groups
  has_many :products, through: :product_groups
  belongs_to :company
end
