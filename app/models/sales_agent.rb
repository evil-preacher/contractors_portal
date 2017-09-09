class SalesAgent < ApplicationRecord
  belongs_to :company

  validates :accounting_system_code, presence: true, uniqueness: { scope: company_id },
                                     length: { maximum: 20 }
  validates :IMEI, presence: true, uniqueness: true, length: { is: 15 }
end
