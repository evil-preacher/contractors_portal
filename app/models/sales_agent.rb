class SalesAgent < ApplicationRecord
  belongs_to :company

  validates :accounting_system_code, presence: true, uniqueness: true,
                                     length: { maximum: 20 }
  validates :IMEI, presence: true, uniqueness: true,
                   length: { is: 15, message: "должен быть 15 символов"  }
end
