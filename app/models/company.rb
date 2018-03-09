class Company < ApplicationRecord
  has_many :users, dependent: :restrict_with_error
  has_many :shops, dependent: :restrict_with_error
  has_many :brands, dependent: :restrict_with_error
  has_many :remainders, dependent: :restrict_with_error
  has_many :sales_agents, dependent: :restrict_with_error
  has_many :price_types, dependent: :restrict_with_error
  has_many :price_lists, dependent: :restrict_with_error
  has_many :load_events, dependent: :restrict_with_error
  has_many :products, dependent: :restrict_with_error
  has_many :order_headers, dependent: :restrict_with_error
  has_many :categories, dependent: :restrict_with_error

  validates :name, presence: true
end
