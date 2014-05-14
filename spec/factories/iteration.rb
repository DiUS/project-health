require 'factory_girl'

FactoryGirl.define do
  sequence(:iteration_name) {|x| "Iteration #{x}"}

	factory :iteration do
    name FactoryGirl.generate :iteration_name
    project
  end
end