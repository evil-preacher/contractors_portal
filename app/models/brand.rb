class Brand < ApplicationRecord
  has_many   :products
  belongs_to :company

  validates :title, presence: true
end
