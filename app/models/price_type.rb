class PriceType < ApplicationRecord
  belongs_to :company
  has_many   :shops, dependent: :restrict_with_error
  has_many   :price_lists, dependent: :restrict_with_error

  validates :accounting_system_code, presence: true, uniqueness: true, length: { maximum: 20 }

  validates :title, presence: true
end
