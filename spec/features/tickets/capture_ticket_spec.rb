require 'rails_helper'

RSpec.describe 'Capturing a ticket', type: :feature do
	let(:organization){create(:organization)}
	let(:user) {create(:user, organization: organization)}
	it 'can be done from the ticket screen' do
		ticket = create(:ticket)
		log_in_as(user)
		visit ticket_path(ticket.id)
		click_on 'Capture'
		expect(current_path).to eq dashboard_path
	end
end
