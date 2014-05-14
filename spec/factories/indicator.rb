require 'factory_girl'

FactoryGirl.define do
  sequence(:indicator_name) {|n| "Indicator #{n}" }

	factory :indicator do
    name FactoryGirl.generate :indicator_name
    category
  end
end