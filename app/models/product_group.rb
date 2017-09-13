class ProductGroup < ApplicationRecord
  has_many   :products, dependent: :restrict_with_error
  belongs_to :product_type
  belongs_to :company, optional: true

  validates :title, presence: true
end
