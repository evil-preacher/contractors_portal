class LoadEvent < ApplicationRecord
  belongs_to :company
  has_many   :remainders
  has_many   :price_lists
end
