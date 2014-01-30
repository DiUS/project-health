require 'spec_helper'

describe Indicator do
  let(:category) { FactoryGirl.create :category }
  let(:indicator) { FactoryGirl.create :indicator, category: category }

	it 'can create indicator' do
    category.indicators.include?(indicator)
  end
end