class ShopSerializer < ActiveModel::Serializer
  attributes :asc, :title, :address, :latitude, :longitude,
             :price_type_asc
end
