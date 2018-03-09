class ProductSerializer < ActiveModel::Serializer
  attributes :accounting_system_code, :title, :barcode,
             :category_accounting_system_code, :brand_accounting_system_code
end
