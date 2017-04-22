require "factory_girl"
require "faker"

FactoryGirl.define do
  factory :message do
    author                                { Faker::Name.name }
    sequence(:text)                       { |n| Faker::Hacker.phrases.join('.')[0..140] }
    sequence(:lat)                        { |n| [49.000793, 49.002471, 49.003588].sample }
    sequence(:lng)                        { |n| [12.095634, 12.104446, 12.094866].sample }
  end
end
