require 'rails_helper'

RSpec.describe Ticket, type: :model do
	let (:ticket) {build(:ticket)}

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
			ticket.id = expected_id
			expect(ticket.to_s).to eq("Ticket #{expected_id}")
		end
	end

	describe "#captured?" do
	    it "is captured if it has an organization" do
	      	baz = Organization.new
	        ticket.organization = baz
	        expect(ticket).to be_captured
	    end
  end

 	describe "scopes" do

 		let(:open_ticket) {create(:ticket, :open_ticket)}
 		let(:closed_ticket) {create(:ticket, :closed_ticket)}
		let(:open_ticket_with_organization){create(:ticket, :open_ticket, :organization)}
		let(:closed_ticket_with_organization){create(:ticket, :closed_ticket, :organization)}

	    describe "open?" do
		    it "should return an open ticket" do
		    	open_tickets = Ticket.open
		    	expect(open_tickets).to include(open_ticket)
		    end
		    it "should not return a closed ticket" do
		    	open_tickets = Ticket.open
		    	expect(open_tickets).not_to include(closed_ticket, closed_ticket_with_organization, open_ticket_with_organization)
		    end
		end
		describe "closed?" do
			it "returns true when ticket is closed" do
				ticket.closed = (:true)
				expect(ticket.closed?).to eq(true)
			end
		end
		describe "all_organization" do 

			it "does not return open tickets without an organization" do
				org_tickets = Ticket.all_organization
				expect(org_tickets).to_not include(open_ticket)
			end
			it  "returns all open tickets with an organization" do
				org_tickets = Ticket.all_organization
				expect(org_tickets).to include(open_ticket_with_organization)
			end
			it "does not return closed tickets without an organization" do
				org_tickets = Ticket.all_organization
				expect(org_tickets).to_not include(closed_ticket)
			end
			it "does not return closed tickets with an organization" do
				org_tickets = Ticket.all_organization
				expect(Ticket.all_organization).to_not include(closed_ticket_with_organization)
			end
		end
		describe "organization" do
			it "does not return tickets without an organization, or closed tickets" do 
				expect(Ticket.organization(open_ticket_with_organization.organization_id)).not_to include open_ticket, closed_ticket, closed_ticket_with_organization
			end
			it "returns open tickets that have an organization_id" do
				expect(Ticket.organization(open_ticket_with_organization.organization_id)).to include(open_ticket_with_organization)
			end
		end
		describe "closed_organization" do
			it "returns a closed ticket with an organization_id " do 
				expect(Ticket.closed_organization(closed_ticket_with_organization.organization_id)).to include closed_ticket_with_organization
				expect(Ticket.closed_organization(open_ticket_with_organization.organization_id)).not_to include closed_ticket, open_ticket, open_ticket_with_organization
			end
		end
		describe "region" do
			it "returns tickets with a region_id" do
				expect(Ticket.region(open_ticket.region_id)).to include open_ticket
			end
			it "will not return tickets without a region_id " do
				expect(Ticket.region(open_ticket.region_id)).not_to include closed_ticket, open_ticket_with_organization,closed_ticket_with_organization
			end
		end
		describe "resource_category" do
			it "returns tickets with a resource_category_id" do
				expect(Ticket.resource_category(open_ticket.resource_category)).to include open_ticket
			end
			it "does not return tickets without a resource_category_id" do
				expect(Ticket.resource_category(open_ticket.resource_category)).not_to include open_ticket_with_organization,closed_ticket_with_organization,closed_ticket
			end
		end
	end
end