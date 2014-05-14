require 'factory_girl'

FactoryGirl.define do
  sequence(:uid) {|n| "person-#{n}@example.com" }
  
  factory :omniauth_hash, class: Hash do
    uid
    info {{
      :first_name => Forgery(:name).first_name,
      :last_name => Forgery(:name).last_name,
      :email => FactoryGirl.generate(:email),
      :image => 'http://lorempixel.com/400/400'
    }}
    
    initialize_with { attributes } 
  end
end