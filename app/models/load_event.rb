class LoadEvent < ApplicationRecord
  belongs_to :company, dependent: :restrict_with_error
  has_many   :remainders, dependent: :restrict_with_error
  has_many   :price_lists, dependent: :restrict_with_error

  validates :loading, presence: { message: "Не может быть пустым" }
end
