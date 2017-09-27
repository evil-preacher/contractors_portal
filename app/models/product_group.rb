class ProductGroup < ApplicationRecord
  has_many   :products, dependent: :restrict_with_error
  belongs_to :product_type, dependent: :restrict_with_error
  belongs_to :company, optional: true, dependent: :restrict_with_error

  validates :title, presence: { message: "Не может быть пустым" }
end
