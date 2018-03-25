class PriceList < ApplicationRecord
  belongs_to :company

  validates :price, presence: true, numericality: true
  validates :price_type_accounting_system_code, presence: true
  validates :product_accounting_system_code, presence: true
end
