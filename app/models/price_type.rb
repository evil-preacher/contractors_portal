class PriceType < ApplicationRecord
  belongs_to :company
  has_many   :shops

  validates :accounting_system_code, presence: true, uniqueness: true,
                                     length: { maximum: 20 }
  validates :title, presence: true
end
