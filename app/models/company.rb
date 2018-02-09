class Company < ApplicationRecord
  has_many :users, dependent: :restrict_with_error
  has_many :shops
  has_many :brands, dependent: :restrict_with_error
  has_many :remainders, dependent: :restrict_with_error
  has_many :sales_agents, dependent: :restrict_with_error
  has_many :price_types, dependent: :restrict_with_error
  has_many :price_lists
  has_many :load_events, dependent: :restrict_with_error
  has_many :product_types, dependent: :restrict_with_error
  has_many :product_groups
  has_many :products
  has_many :order_headers
  has_many :categories

  validates :name, presence: true
  validates :bin, presence: true, uniqueness: true, length: { is: 12 }
  validates :phone, presence: true
  validates :address, presence: true
end
