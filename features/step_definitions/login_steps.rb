When(/^I am logged in as "(.*?)"$/) do |first_name|
  omniauthhash = FactoryGirl.build :omniauth_hash
  omniauthhash[:info][:first_name] = first_name;
  
  OmniAuth.config.test_mode = true
  OmniAuth.config.add_mock(:google_oauth2, omniauthhash)
  
  visit '/auth/google_oauth2/'
end