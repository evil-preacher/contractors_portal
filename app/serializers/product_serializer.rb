class ProductSerializer < ActiveModel::Serializer
  attributes :asc, :title, :barcode,
             :category_asc, :brand_asc
end
