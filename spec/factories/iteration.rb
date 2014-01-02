require 'factory_girl'

FactoryGirl.define do
	factory :iteration do
    initialize_with { Iteration.where(project: project, sort_order: sort_order).first_or_initialize }
    name 'Iteration 1'
    sort_order 1
    status = Iteration::CURRENT
    project
  end
end