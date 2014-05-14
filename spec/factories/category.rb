require 'factory_girl'

FactoryGirl.define do
  sequence(:category_name) {|n| "Category #{n}" }

  factory :category do
    name FactoryGirl.generate :category_name
  end
end