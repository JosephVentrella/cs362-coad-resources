require 'rails_helper'

RSpec.describe 'User registration', type: :feature do
	context 'As a not registered user' do
		it "responds with a prompt to confirm email when a valid email is entered" do
			visit signup_path
			fill_in "user_email", with: "user@user.com"
			fill_in "user_password", with: "password"
			fill_in "user_password_confirmation", with: "password"
			click_on "commit"
			expect(page).to have_content("confirmation link")
		end
		it 'does not register a user when input is not valid' do
			visit signup_path
			fill_in "user_email", with: "user@user.com"
			fill_in "user_password", with: "password"
			fill_in "user_password_confirmation", with: 'wrongPassword'
			click_on "commit"
			expect(page).to have_content("Password confirmation doesn't match Password")
		end
	end
end
