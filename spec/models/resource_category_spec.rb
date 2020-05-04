require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
	let (:resource_category){ResourceCategory.new()}

describe "attributes" do
	it "exists" do
		resourcecat = ResourceCategory.new
	end     
    it "validates presence of name" do
     expect(resource_category).to validate_presence_of(:name)
    end
    it "validates length of name" do
     expect(resource_category).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
    end
    it "validates uniqueness of name" do
  	  resource_category = ResourceCategory.new
  	  expect(resource_category).to validate_uniqueness_of(:name).case_insensitive
  	end
end

	it "should print name" do
      expected_name = "Testy Testinson"
      resource_category = ResourceCategory.new(name: expected_name)
      expect(resource_category.to_s).to eq(expected_name)
	end

  describe "inactive?" do
    it "should be return true when not active" do
      r = ResourceCategory.new
      r.active = (:false)
      expect(r.inactive?).to eq(true)
    end
  end

  describe "deactivate" do
    it " correctly updates to deactivate"do
     r = ResourceCategory.new
     r.deactivate
     expect(r.active).to eq(false)
     
    end
  end

  describe "activate" do
    it " correctly updates to active"do
     r = ResourceCategory.new
     r.activate
     expect(r.active).to eq(true)
     
    end
  end


  describe "find_or_create_by" do
      it "creates a name if one isnt given " do
      expect(ResourceCategory.unspecified.name).to eq('Unspecified')
    end

    it "does not creates the name 'unspecified' if one is given " do
      test_string = "test"
      r = ResourceCategory.new(name: test_string)
      expect(r.name).to_not eq('Unspecified')
    end
  end

end
 
