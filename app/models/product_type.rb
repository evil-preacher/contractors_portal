class ProductType < ApplicationRecord
  has_many :product_groups, dependent: :restrict_with_error
  has_many :products, through: :product_groups
  belongs_to :company

  validates :title, presence: true
end
