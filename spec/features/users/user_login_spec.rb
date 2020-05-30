require 'rails_helper'

RSpec.describe 'Logging in', type: :feature do
	let(:user) {create(:user)}

	context 'As an organization user' do
		it "displays the organization dashboard when a user logs in" do
			visit login_path
			fill_in "user_email", with: user.email
			fill_in "user_password", with: user.password
			click_on 'commit'
			expect(page).to have_content('Dashboard')
		end
	end
end