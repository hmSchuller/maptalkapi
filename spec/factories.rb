require "factory_girl"
require "faker"

FactoryGirl.define do
  factory :message do
    author                                { Faker::Name.name }
    sequence(:text)                       { |n| Faker::Hacker.phrases.join('.')[0..140] }
    sequence(:lat)                        { |n| Faker::Address.latitude }
    sequence(:lng)                        { |n| Faker::Address.longitude }
  end
end
