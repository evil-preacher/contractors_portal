class ProductGroup < ApplicationRecord
  has_many   :products, dependent: :restrict_with_error
  belongs_to :product_type
  belongs_to :company

  validates :title, presence: true
end
