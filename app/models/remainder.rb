class Remainder < ApplicationRecord
  belongs_to :company
  belongs_to :load_event
  belongs_to :product
end
