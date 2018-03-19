class OrderHeader < ApplicationRecord
  belongs_to :company
  has_many   :order_tables, dependent: :destroy

  accepts_nested_attributes_for :order_tables

  # validates :imei, presence: true, uniqueness: true, length: { is: 15 }
  # validates :shop_id, presence: true
end
