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

require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
