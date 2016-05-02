require 'spec_helper'

describe BeelineMatcher do
	before(:each) do
		@ingredients = BeelineMatcher::Ingredients.new("http://food2fork.com/view/35120")
    @model = BeelineMatcher::Model.new("bin/model_file")
	end
  it 'has a version number' do
    expect(BeelineMatcher::VERSION).not_to be nil
  end

  it 'creates a new ingredients object' do
  	expect(@ingredients).not_to be nil
  end

  it 'retrieves ingredients from food2fork' do
  	expect(@ingredients.get_ingredients.length).to be 6
  end

  it 'creates a model object' do
    expect(@model).not_to be nil
  end

  it 'has a file associated with the model' do
    expect(@model.file).not_to be nil
  end

  it 'recognizes crf_version' do
    puts BeelineMatcher::CRF_VERSIONs
    expect(BeelineMatcher::CRF_VERSION).not_to be nil
  end
end
