require 'spec_helper'

describe Indicator do
  before {
    @category = FactoryGirl.create :category
    @indicator = FactoryGirl.create :indicator, category: @category
  }

	it 'can create indicator' do
    @category.indicators.include?(@indicator)
  end
end