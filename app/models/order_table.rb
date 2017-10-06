class OrderTable < ApplicationRecord
  belongs_to :order_header
  belongs_to :product
  belongs_to :price_list

  validates :count, presence: true, numericality: true
  validates :cost, presence: true, numericality: true
end
