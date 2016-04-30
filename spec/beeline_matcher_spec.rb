require 'spec_helper'

describe BeelineMatcher do
	before(:each) do
		@matcher = BeelineMatcher::Ingredients.new("http://food2fork.com/view/35120")
	end
  it 'has a version number' do
    expect(BeelineMatcher::VERSION).not_to be nil
  end

  it 'creates a new object' do
  	expect(@matcher).not_to be nil
  end

  it 'retrieves ingredients from food2fork' do
  	expect(@matcher.get_ingredients.length).to be 6
  end
end
