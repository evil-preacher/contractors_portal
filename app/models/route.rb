class Route < ApplicationRecord
  belongs_to :company

  validates :sale_agent_asc, presence: true
  validates :shop_asc, presence: true
  validates :day, presence: true, numericality: true
  validates :index_number, presence: true, numericality: true
end
