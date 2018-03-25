require 'csv'

class Product < ApplicationRecord
  belongs_to :company

  validates :title, presence: true
  validates :accounting_system_code, presence: true, length: { maximum: 20 }
  validates :barcode, presence: true, length: { maximum: 20 }
  validates :category_accounting_system_code, presence: true
end
