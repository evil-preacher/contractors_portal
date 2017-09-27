class PriceType < ApplicationRecord
  belongs_to :company, dependent: :restrict_with_error
  has_many   :shops, dependent: :restrict_with_error
  has_many   :price_lists, dependent: :restrict_with_error

  validates :accounting_system_code, presence:   { message: "Не может быть пустым" },
                                     uniqueness: { message: "Такой КУС уже существует" },
                                     length:     { maximum: 20, message: "должен быть не более 20 символов" }

  validates :title, presence: { message: "Не может быть пустым" }
end
