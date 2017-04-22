# encoding: UTF-8
require File.expand_path("spec/factories.rb")


namespace :seed do
  task all: :environment do
    (rand(10) + 10).times do
      message = FactoryGirl.create(:message, author: 'Der Solleder', text: 'Ewald stinkt')
      message = FactoryGirl.create(:message, author: 'Sveti', text: 'Ewalds Hose mieft')

      message = FactoryGirl.create(:message, author: 'hm Schuller')
      message = FactoryGirl.create(:message, author: 'Der Solleder')
      message = FactoryGirl.create(:message, author: 'Xanthras')
      message = FactoryGirl.create(:message, author: 'Korbinian')
    end
  end

  task reset: :environment do
    if Rails.env.development?
      Rake::Task["db:reset"].invoke
      Rake::Task["db:seed"].invoke
      Rake::Task["seed:all"].invoke
    end
  end
end
