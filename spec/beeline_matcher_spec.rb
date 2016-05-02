require 'spec_helper'

describe BeelineMatcher do
	before(:each) do
		@ingredients = BeelineMatcher::Ingredients.new("http://food2fork.com/view/35120")
    @model = BeelineMatcher::Model.new("bin/model_file")
    @parser = BeelineMatcher::Parser.new("http://food2fork.com/view/35120")
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

  it 'should generate a filename' do
    expect(@ingredients.filename).not_to be nil
  end

  it 'should save raw ingredients to file' do
    expect(@ingredients.save).to be @ingredients.filename
  end

  it 'parsher should save ingredients to file' do
    expect(@parser.save_ingredients_to_file).to be @parser.ingredients.filename
  end
end
