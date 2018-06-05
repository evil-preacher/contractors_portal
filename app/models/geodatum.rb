class Geodatum < ApplicationRecord
  belongs_to :company

  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :time, presence: true
  validates :sales_agent_asc, presence: true
end
