class Product < ApplicationRecord
  belongs_to :product_group, dependent: :restrict_with_error
  belongs_to :company, dependent: :restrict_with_error
  belongs_to :brand, optional: true
  has_many   :remainders, dependent: :restrict_with_error
  has_many   :price_lists, dependent: :restrict_with_error

  validates :title, presence: { message: "Не может быть пустым" }
  validates :accounting_system_code, presence: { message: "Не может быть пустым" },
                                     uniqueness: { message: "Такой КУС уже существует" },
                                     length: { maximum: 20, message: "должен быть не более 20 символов" }
  validates :barcode, presence: { message: "Не может быть пустым" },
                      uniqueness: { message: "Такой штрихкод уже создан" },
                      length: { maximum: 20, message: "должен быть не более 20 символов" }
end
