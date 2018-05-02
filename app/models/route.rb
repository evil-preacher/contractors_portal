class Route < ApplicationRecord
  belongs_to :company
  belongs_to :user
  belongs_to :shop

  validates :shop_id, presence: true
  validates :user_id, presence: true
  validates :day, presence: true
end
