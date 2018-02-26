class PriceList < ApplicationRecord
  belongs_to :company
  belongs_to :product, class_name: "Product", foreign_key: "accounting_system_code", primary_key: "accounting_system_code"
  belongs_to :price_type, class_name: "PriceType", foreign_key: "accounting_system_code", primary_key: "accounting_system_code"
  belongs_to :load_event, optional: true
  has_many :order_tables

  validates :price, presence: true, numericality: true
end
