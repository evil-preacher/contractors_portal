class Day < ApplicationRecord
  has_many :routes

  validates :title, presence: true
end
