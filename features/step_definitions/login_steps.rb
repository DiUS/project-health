When(/^test user Steve Heartmaker logs in$/) do
  OmniAuth.config.test_mode = true
  OmniAuth.config.add_mock(:google_oauth2, {
    :uid => 'TESTUID-Steve',
    :info => {
      :first_name => 'Steve',
      :last_name => 'Heartmaker',
      :email => 'SteveHeartmaker@example.com',
      :image => 'http://lorempixel.com/400/200'
    }
  })
  
  visit '/auth/google_oauth2/'
end

Then(/^he should be greeted by "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end