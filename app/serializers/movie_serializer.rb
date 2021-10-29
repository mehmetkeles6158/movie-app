class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :year, :plot
  has_many :genres
end
