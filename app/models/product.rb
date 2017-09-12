class Product < ApplicationRecord
  belongs_to :product_group
  belongs_to :product_type
  belongs_to :company

  validates :title, presence: true
  validates :accounting_system_code, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :barcode, presence: true, uniqueness: true, length: { maximum: 20 }
end
