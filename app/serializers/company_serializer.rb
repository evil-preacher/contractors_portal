class CompanySerializer < ActiveModel::Serializer
  attributes :id

  has_many :categories
  has_many :price_types
  has_many :brands
  has_many :price_lists
  has_many :remainders
  has_many :shops
  has_many :products
  has_many :routes
end
