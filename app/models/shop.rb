class Shop < ApplicationRecord
  belongs_to :company
  belongs_to :price_type

  has_many   :order_headers

  validates :title, presence: true
  validates :accounting_system_code, presence: true, length: { maximum: 20 }
end
