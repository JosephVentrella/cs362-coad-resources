require 'rails_helper'

RSpec.describe Ticket, type: :model do
	let (:ticket){Ticket.new}

	describe 'relationships' do
		it { should belong_to(:region) }
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
	end


end
