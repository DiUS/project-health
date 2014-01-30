require 'factory_girl'

FactoryGirl.define do
	factory :indicator do
    initialize_with { Indicator.where(category: category).first_or_initialize }
    name 'indicator 1'
  end
end