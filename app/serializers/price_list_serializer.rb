class PriceListSerializer < ActiveModel::Serializer
  attributes :price, :price_type_asc, :product_asc
end
