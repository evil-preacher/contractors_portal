class Shop < ApplicationRecord
  belongs_to :company

  has_many   :order_headers
  has_many   :routes, dependent: :destroy

  validates :title, presence: true
  validates :asc, presence: true, length: { maximum: 20 }
end
