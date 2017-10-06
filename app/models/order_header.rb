class OrderHeader < ApplicationRecord
  belongs_to :company
  belongs_to :shop
  has_many   :order_tables, dependent: :destroy

  validates :accounting_system_code, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :imei, presence: true, uniqueness: true, length: { is: 15 }
  validates :shop_id, presence: true
end
