class Remainder < ApplicationRecord
  belongs_to :load_event, optional: true
  belongs_to :product
  belongs_to :company

  validates :remainder, presence: true, numericality: true
end
