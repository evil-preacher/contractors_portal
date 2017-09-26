class Product < ApplicationRecord
  belongs_to :product_group
  belongs_to :company
  belongs_to :brand, optional: true
  has_many   :remainders

  validates :title, presence: true
  validates :accounting_system_code, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :barcode, presence: true, uniqueness: true, length: { maximum: 20 }
end
