class OrderTableSerializer < ActiveModel::Serializer
  attributes :product_asc, :price, :count, :cost
end
