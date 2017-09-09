class Company < ApplicationRecord
  has_many :users
  has_many :shops

  validates :name, presence: true
  validates :bin, presence: true, uniqueness: true, length: { is: 12 }
  validates :phone, presence: true
  validates :address, presence: true
end
