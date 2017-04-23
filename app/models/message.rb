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

  MILES = 0.000621371

  def self.clean(msg)
    msgs = self.within(1 * MILES, origin: msg)
    if msgs.count > 50
      msgs.sort do |a, b|
        da = a.distance_to(msg)
        db = b.distance_to(msg)
        da > db ? 1 : (da == db ? 0 : -1)
      end[50..(msgs.count)].each do |msg|
        msg.destroy
      end
    end
  end
end
