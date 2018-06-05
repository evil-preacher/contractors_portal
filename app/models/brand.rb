class Brand < ApplicationRecord
  belongs_to :company

  validates :title, presence: true, length: { maximum: 50 }
  validates :asc, presence: true, length: { maximum: 20 }
end

