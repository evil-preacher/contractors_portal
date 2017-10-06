class PriceList < ApplicationRecord
  belongs_to :company
  belongs_to :product
  belongs_to :price_type
  belongs_to :load_event, optional: true
  has_many :order_tables

  validates :price, presence: true, numericality: true
end
