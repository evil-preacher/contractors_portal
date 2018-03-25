class PriceType < ApplicationRecord
  belongs_to :company

  validates :accounting_system_code, presence: true, length: { maximum: 20 }
  validates :title, presence: true
end
