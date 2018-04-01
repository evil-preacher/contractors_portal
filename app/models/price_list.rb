class PriceList < ApplicationRecord
  belongs_to :company

  validates :price, presence: true, numericality: true
  validates :price_type_asc, presence: true
  validates :product_asc, presence: true
end
