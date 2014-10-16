class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :tagline, :description, :data, :summary
end