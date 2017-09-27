class Brand < ApplicationRecord
  has_many   :products, dependent: :restrict_with_error
  belongs_to :company, dependent: :restrict_with_error

  validates :title, presence: { message: "Не может быть пустым" }
end
