require 'rails_helper'

RSpec.describe Organization, type: :model do
	let (:organization) {Organization.new}
	it "exists" do
		organization = Organization.new
	end
	describe "attributes" do
		it "should have agreement_one" do
			expect(organization).to respond_to(:agreement_one)
		end
		it "should have agreement_two" do
			expect(organization).to respond_to(:agreement_two)
		end
		it "should have agreement_three" do
			expect(organization).to respond_to(:agreement_three)
		end
		it "should have agreement_four" do
			expect(organization).to respond_to(:agreement_four)
		end
		it "should have agreement_five" do
			expect(organization).to respond_to(:agreement_five)
		end
		it "should have agreement_six" do
			expect(organization).to respond_to(:agreement_six)
		end
		it "should have agreement_seven" do
			expect(organization).to respond_to(:agreement_seven)
		end
		it "should have agreement_eight" do
			expect(organization).to respond_to(:agreement_eight)
		end
		it "should have a name" do 
			expect(organization).to respond_to(:name)
		end
		it "should have a status" do
			expect(organization).to respond_to(:status)
		end
		it "should have a phone" do
			expect(organization).to respond_to(:phone)
		end
		it "should have a email" do
			expect(organization).to respond_to(:email)
		end
		it "it has a description" do
			expect(organization).to respond_to(:description)
		end
		it "has a rejection_reason" do
			expect(organization).to respond_to(:rejection_reason)
		end
		it "has a liability_insurance" do
			expect(organization).to respond_to(:liability_insurance)
		end
		it "has a primary_name" do
			expect(organization).to respond_to(:primary_name)
		end
		it "has a secondary_name" do
			expect(organization).to respond_to(:secondary_name)
		end
		it "has a secondary_phone" do
			expect(organization).to respond_to(:secondary_phone)
		end
		it "has a title" do
			expect(organization).to respond_to(:title)
		end
		it "has a transportation" do
			expect(organization).to respond_to(:transportation)
		end
	end
	describe "relationships" do
		it "has many users" do
			expect(organization).to have_many(:users)
		end
		it "has many tickets" do
			expect(organization).to have_many(:tickets)
		end
		it "has and belongs to many resource categories" do
			expect(organization).to have_and_belong_to_many(:resource_categories)
		end
	end
	describe "validations" do
		it "validates email" do
			expect(organization).to validate_presence_of(:email)
		end
		it "validates length of email" do
			expect(organization).to validate_length_of(:email).is_at_least(1).is_at_most(255).on(:create)
		end
		it "email is invalid" do
			expect(organization).to validate_presence_of(:email)
		end
	end
	describe "#to_s" do
		it "has a string representation that is the name" do
			expected_name = "TEST"
			organization = Organization.new(name: expected_name)
			expect(organization.to_s).to eq(expected_name)
		end
	end
end
