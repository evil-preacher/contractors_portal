class Remainder < ApplicationRecord
  belongs_to :load_event, optional: true
  belongs_to :product, class_name: "Product", foreign_key: "accounting_system_code", primary_key: "accounting_system_code"
  belongs_to :company

  validates :remainder, presence: true, numericality: true
end
