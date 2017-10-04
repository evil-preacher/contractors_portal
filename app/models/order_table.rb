class OrderTable < ApplicationRecord
  belongs_to :order_header

  validates :count, presence: true, numericality: true
  validates :cost, presence: true, numericality: true
end
