require 'rails_helper'

RSpec.describe Region, type: :model do
		it "exists" do
			region = Region.new
		end
		describe 'relationships' do
			it "has many tickets" do
				region = Region.new
				expect(region).to have_many(:tickets)
			end
		end
		describe "validations" do
			it "validates name" do
				region = Region.new
				expect(region).to validate_presence_of(:name)
			end
			it "validates length of name" do
				region = Region.new
				expect(region).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
			end
			it "validates uniqueness of name" do
				region = Region.new
				expect(region).to validate_uniqueness_of(:name).case_insensitive
			end
		end

	describe "find_or_create_by" do
		  it "creates a name if one isnt given " do
		  	expect(Region.unspecified.name).to eq('Unspecified')
		end

		it "does not creates the name 'unspecified' if one is given " do
			test_string = "test"
			r = Region.new(name: test_string)
			expect(r.name).to_not eq('Unspecified')
		end
		
	end

		describe "to_s" do
		  it "prints the name" do
			 test_name = "test"
			 r = Region.new(name: test_name)
			 expect(r.to_s).to eq(test_name)
		  end

		end

end