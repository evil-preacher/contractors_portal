class Category < ApplicationRecord
  belongs_to :company

  validates :title, presence: true, length: { maximum: 50 }
  validates :accounting_system_code, presence: true, length: { maximum: 20 }
end
