require 'factory_girl'

FactoryGirl.define do
  sequence(:name) {|n| "Indicator #{n}" }

	factory :indicator do
    name
    category
  end
end