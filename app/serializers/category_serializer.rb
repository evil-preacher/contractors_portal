class CategorySerializer < ActiveModel::Serializer
  attributes :accounting_system_code, :title, :parent_code
end
