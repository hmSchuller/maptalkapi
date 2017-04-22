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

class Message < ActiveRecord::Base
  acts_as_mappable

  validates :lat, presence: true
  validates :lng, presence: true
  validates :text, presence: true, length: {minimum: 3, maximum: 160}
  validates :author, presence: true
end
