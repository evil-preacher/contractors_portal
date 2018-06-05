class OrderTable < ApplicationRecord
  belongs_to :order_header, optional: true, inverse_of: :order_tables

  # validates :count, presence: true, numericality: true
  # validates :cost, presence: true, numericality: true
end
