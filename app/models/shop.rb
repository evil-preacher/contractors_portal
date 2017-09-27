class Shop < ApplicationRecord
  belongs_to :company, dependent: :restrict_with_error
  belongs_to :price_type, dependent: :restrict_with_error

  validates :title, presence: { message: "Не может быть пустым" }
  validates :accounting_system_code, presence: { message: "Не может быть пустым" },
                                     uniqueness: { message: "Такой КУС уже существует" },
                                     length: { maximum: 20, message: "должен быть не более 20 символов" }
end
