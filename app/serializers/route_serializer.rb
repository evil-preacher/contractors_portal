class RouteSerializer < ActiveModel::Serializer
  attributes :index_number, :user_id, :day_id, :shop_asc

  def shop_asc
    object.shop.asc
  end
end
