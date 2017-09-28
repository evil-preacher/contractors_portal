class Shop < ApplicationRecord
  belongs_to :company
  belongs_to :price_type

  validates :title, presence: true
  validates :accounting_system_code, presence: true, uniqueness: true, length: { maximum: 20 }
end
