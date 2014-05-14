require 'factory_girl'

FactoryGirl.define do
  sequence :project_name do |n| "Project ##{n}" end

  factory :project do
    name FactoryGirl.generate :project_name
    indicators { build_list :indicator, 3 }
    users { build_list :user, 3 }
  end
end