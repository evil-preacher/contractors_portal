class PriceListSerializer < ActiveModel::Serializer
  attributes :price, :price_type_accounting_system_code, :product_accounting_system_code
end
