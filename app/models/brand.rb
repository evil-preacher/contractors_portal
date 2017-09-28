class Brand < ApplicationRecord
  has_many   :products, dependent: :restrict_with_error
  belongs_to :company

  validates :title, presence: true, length: { maximum: 50 }
end
