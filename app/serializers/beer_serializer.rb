class BeerSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :brewery, :rating, :location, :type
end
