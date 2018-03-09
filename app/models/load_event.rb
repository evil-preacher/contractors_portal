class LoadEvent < ApplicationRecord
  belongs_to :company

  validates :loading, presence: true
end
