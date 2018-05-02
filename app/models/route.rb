class Route < ApplicationRecord
  belongs_to :company
  belongs_to :user
  belongs_to :shop
  belongs_to :day

  validates :shop_id, presence: true
  validates :user_id, presence: true
  validates :day_id, presence: true
end
