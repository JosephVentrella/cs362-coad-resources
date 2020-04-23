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
end