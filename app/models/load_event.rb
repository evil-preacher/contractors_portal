class LoadEvent < ApplicationRecord
  belongs_to :company
  has_many   :remainders
end
