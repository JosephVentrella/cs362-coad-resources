require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
	let (:resource_category){build(:resource_category)}

  describe "attributes" do

    it "validates presence of name" do
     expect(resource_category).to validate_presence_of(:name)
    end
    it "validates length of name" do
     expect(resource_category).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
    end
    it "validates uniqueness of name" do
  	  expect(resource_category).to validate_uniqueness_of(:name).case_insensitive
  	end
  end
  describe "to_s" do

  	it "should print name" do
      expect(resource_category.to_s).to eq(resource_category.name)
    end
  end

  describe "inactive?" do
    it "should return true when not active" do
      resource_category.active = (:false)
      expect(resource_category.inactive?).to eq(true)
    end
  end

  describe "deactivate" do
    it " correctly updates to deactivate"do
     resource_category.deactivate
     expect(resource_category.active).to eq(false)
    end
  end

  describe "activate" do
    it " correctly updates to active"do
     resource_category.activate
     expect(resource_category.active).to eq(true)
     
    end
  end

  describe "find_or_create_by" do
      it "creates a the name 'Unspecified' if one isnt given " do
      expect(ResourceCategory.unspecified.name).to eq('Unspecified')
    end

    it "does not create the name 'unspecified' if one is given " do
      test_string = "test"
      resource_category = ResourceCategory.new(name: test_string)
      expect(resource_category.name).to_not eq('Unspecified')
    end
  end

end
 
