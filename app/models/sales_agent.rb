class SalesAgent < ApplicationRecord
  belongs_to :company, dependent: :restrict_with_error

  validates :accounting_system_code, presence:   { message: "Не может быть пустым" },
                                     uniqueness: { message: "Такой КУС уже существует" },
                                     length:     { maximum: 20, message: "должен быть не более 20 символов" }
  validates :IMEI, presence:   { message: "Не может быть пустым" },
                   uniqueness: { message: "Такой IMEI уже существует" },
                   length:     { is: 15, message: "должен быть 15 символов"  }
end
