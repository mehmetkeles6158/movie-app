class ActorSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :known_for
  # belongs_to :movie
end
