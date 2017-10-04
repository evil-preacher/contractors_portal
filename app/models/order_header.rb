class OrderHeader < ApplicationRecord
  belongs_to :company

  validates :accounting_system_code, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :IMEI, presence: true, uniqueness: true, length: { is: 15 }
  validates :shop_id, presence: true
  validates :sum, presence: true, numericality: true
end
