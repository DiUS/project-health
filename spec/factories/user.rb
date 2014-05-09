require 'factory_girl'

FactoryGirl.define do
  sequence(:email) {|n| "person-#{n}@example.com" }
  sequence(:google_uid) {|n| "person-#{n}@example.com" }
  
  factory :user do
    email
    first_name { Forgery(:name).first_name }
    last_name { Forgery(:name).last_name }
    google_uid
    picture_url "http://lorempixel.com/400/200/people/"
  end
end