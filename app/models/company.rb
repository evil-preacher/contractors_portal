class Company < ApplicationRecord
  has_many :users
  has_many :shops
  has_many :sales_agents
  has_many :price_types

  validates :name, presence: true
  validates :bin, presence: true, uniqueness: true, length: { is: 12 }
  validates :phone, presence: true
  validates :address, presence: true
end
