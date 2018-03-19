class OrderHeaderSerializer < ActiveModel::Serializer
  attributes :id, :current_date, :delivery_date, :shop_asc, :with_docs, :imei, :sum,
             :wtf_code, :comment
  has_many :order_tables
end
