class Remainder < ApplicationRecord
  belongs_to :load_event, optional: true
  belongs_to :company

  validates :remainder, presence: true, numericality: true
  validates :product_accounting_system_code, presence: true
end
