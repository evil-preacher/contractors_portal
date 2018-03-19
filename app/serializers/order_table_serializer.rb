class OrderTableSerializer < ActiveModel::Serializer
  attributes :product_asc, :price_list_id, :count, :cost
end
