class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :data, :summary
end