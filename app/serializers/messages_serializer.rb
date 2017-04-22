class MessagesSerializer < ActiveModel::Serializer
  attributes :id, :body, :lat, :lng, :author
end
