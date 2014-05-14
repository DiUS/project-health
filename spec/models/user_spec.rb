require 'spec_helper'

describe User do
  let(:project) { FactoryGirl.create :project }
  let(:iteration) { FactoryGirl.create :iteration }
  let(:user) { FactoryGirl.create :user }
  let(:omniauth_hash) { FactoryGirl.build :omniauth_hash}

  it 'user has not voted yet' do
    expect(user.has_voted_for? iteration).to eq(false)
  end
  
  it 'user has voted' do
    user.voted_for iteration
    expect(user.has_voted_for? iteration).to eq(true)
  end
  
  it 'user gets generated on first auth' do
    expect {
      User.find_or_create_from_google_auth_hash omniauth_hash
    }.to change(User, :count).by(1)
  end

  it 'user gets generated on first auth' do
    user.google_uid = omniauth_hash[:uid]
    user.save!

    expect {
      User.find_or_create_from_google_auth_hash omniauth_hash
    }.to change(User, :count).by(0)
  end
end
