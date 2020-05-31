require 'rails_helper'

RSpec.describe 'Logging in', type: :feature do

	context 'As an organization user' do
		let(:user) {create(:user, :organization)}
		it "displays the dashboard when a user logs in" do
			visit login_path
			fill_in "user_email", with: user.email
			fill_in "user_password", with: user.password
			click_on 'commit'
			expect(page).to have_content('Dashboard')
		end
		it "tells the user when the values input are invalid and the login is invalid" do
			visit login_path
			fill_in "user_email", with: user.email
			fill_in "user_password", with: "wrong password"
			click_on "commit"
			expect(page).to have_content("Invalid")
		end
	end
	 
	context "as an admin" do 
		let(:admin) { create(:user, :admin) }
   		before (:each) { admin.confirm }
  		it "displays the admin dashbord when an admin user logs in" do 
     		visit login_path
      		fill_in "user_email", with: admin.email
      		fill_in "user_password", with: admin.password
      		click_on "commit"
     		expect(page).to have_content("Dashboard")
    	end
    end
end