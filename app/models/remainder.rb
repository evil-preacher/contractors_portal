class Remainder < ApplicationRecord
  belongs_to :load_event
  belongs_to :product

  validates :remainder, presence: true, numericality: true
end
