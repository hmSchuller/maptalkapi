# == Schema Information
#
# Table name: messages
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  lat          :float            not null
#  lng          :float            not null
#  text         :string           not null
#  author       :string           not null
#  message_type :string           default("comment"), not null
#

class MessageSerializer < ActiveModel::Serializer
  attributes :id, :text, :lat, :lng, :author, :type, :created_at


  def type
    object.message_type
  end
end
