class OrderHeader < ApplicationRecord
  belongs_to :company
  has_many   :order_tables, dependent: :destroy, inverse_of: :order_header

  accepts_nested_attributes_for :order_tables

  # validates :imei, presence: true, length: { is: 15 }
  validates :shop_asc, presence: true
end
