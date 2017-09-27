class ProductType < ApplicationRecord
  has_many :product_groups, dependent: :restrict_with_error
  has_many :products, through: :product_groups
  belongs_to :company, dependent: :restrict_with_error

  validates :title, presence: { message: "Не может быть пустым" }
end
