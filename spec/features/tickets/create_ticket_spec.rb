require 'rails_helper'

RSpec.describe 'Creating a Ticket', type: :feature do
	before :each do
		@region = Region.create(name: "Test Region")
		@resource_category = ResourceCategory.create(name: 'Test Category')
	end

	it 'displays a success message' do
		visit new_ticket_path
		fill_in 'Full Name', with: 'Test Name'
		fill_in 'Phone Number', with: 4802580854
		select @region.name, from: 'Region'
		select @resource_category.name, from: 'Resource Category'
		fill_in 'Description', with: 'Fake'
		click_on 'Send this help request'
		expect(page).to have_content('Submitted')
	end

	it 'displays an error message when phone number is not valid' do
		visit new_ticket_path
		fill_in 'Full Name', with: 'Test Name'
		fill_in 'Phone Number', with: 'NOT VALID'
		select @region.name, from: 'Region'
		select @resource_category.name, from: 'Resource Category'
		fill_in 'Description', with: 'TEST FAKE'
		click_on 'Send this help request'
		expect(page).to have_content('error')
	end
		it 'displays an error message when Full Name is not valid' do
		visit new_ticket_path
		fill_in 'Full Name', with: ''
		fill_in 'Phone Number', with: '4802580854'
		select @region.name, from: 'Region'
		select @resource_category.name, from: 'Resource Category'
		fill_in 'Description', with: 'TEST FAKE'
		click_on 'Send this help request'
		expect(page).to have_content('error')
	end
end
