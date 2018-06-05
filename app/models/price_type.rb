class PriceType < ApplicationRecord
  belongs_to :company

  validates :asc, presence: true, length: { maximum: 20 }
  validates :title, presence: true
end
