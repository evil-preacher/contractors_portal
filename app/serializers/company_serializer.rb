class CompanySerializer < ActiveModel::Serializer
  attributes :id

  has_many :product_groups
  has_many :price_types
  has_many :brands
  has_many :load_events
  has_many :price_lists
  has_many :remainders
  has_many :shops
  has_many :products
end
