class PriceType < ApplicationRecord
  belongs_to :company
  has_many   :shops, dependent: :restrict_with_error
  has_many   :price_lists, dependent: :restrict_with_error, class_name: "PriceList", foreign_key: "price_type_accounting_system_code", primary_key: "price_type_accounting_system_code"

  validates :accounting_system_code, presence: true, length: { maximum: 20 }
  validates :title, presence: true
end
