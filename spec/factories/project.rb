require 'factory_girl'

FactoryGirl.define do
  factory :project do
    initialize_with { Project.where(name: name).first_or_initialize }
    name 'My Project'
  end
end