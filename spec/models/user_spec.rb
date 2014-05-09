require 'spec_helper'

describe User do
  let(:project) { FactoryGirl.create :project }
  let(:iteration) { FactoryGirl.create :iteration }
  let(:user) { FactoryGirl.create :user }

  it 'user has not voted yet' do
    expect(user.has_voted_for? iteration).to eq(false)
  end
  
  it 'user has voted' do
    user.voted_for iteration
    expect(user.has_voted_for? iteration).to eq(true)
  end
end
