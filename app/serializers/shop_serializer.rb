class ShopSerializer < ActiveModel::Serializer
  attributes :accounting_system_code, :title, :address, :latitude, :longitude,
             :price_type_accounting_system_code
end
