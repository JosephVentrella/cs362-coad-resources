require 'rails_helper'

RSpec.describe Ticket, type: :model do
	let (:ticket){Ticket.new}

	describe 'relationships' do
		it { should belong_to(:region) }
		it "belongs to resource_category" do 
			expect(ticket).to belong_to(:resource_category)
		end
	end
	describe 'attributes' do
		it "has a name" do
			expect(ticket).to respond_to(:name)
		end
		it "has a description" do
			expect(ticket).to respond_to(:description)
		end
		it "has a phone" do
			expect(ticket).to respond_to(:phone)
		end
		it "has an organization_id" do
			expect(ticket).to respond_to(:organization_id)
		end
		it "has a resource_category_id" do
			expect(ticket).to respond_to(:resource_category_id)
		end
		it "has a region_id" do
			expect(ticket).to respond_to(:region_id)
		end
	end
	describe 'validations' do 
		it "validates name" do
			expect(ticket).to validate_presence_of(:name)
		end
		it "validates phone" do 
			expect(ticket).to validate_presence_of(:phone)
		end
		it "validates region_id" do
			expect(ticket).to validate_presence_of(:region_id)
		end
		it "validates resource_category_id" do 
			expect(ticket).to validate_presence_of(:resource_category_id)
		end 
		it "validates length of name" do
			expect(ticket).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
		end
		it "validates length of description" do
			expect(ticket).to validate_length_of(:description).is_at_most(1020).on(:create)
		end
	end
	describe "#to_s" do
		it "has a string representation that is the Ticket id" do
			expected_id = 22
			ticket = Ticket.new(id: expected_id)
			expect(ticket.to_s).to eq("Ticket #{expected_id}")
		end
	end
end