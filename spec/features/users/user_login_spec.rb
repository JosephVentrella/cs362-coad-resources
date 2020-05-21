require 'rails_helper'

RSpec.describe 'Logging in', type: :feature do
before :each do
	@user = User.build(email:"yoyotest@test.com", password:"thisisatest")

end
it 'takes us to the dashboard'do
	log_in_as(@user)
	expect(page).to have_content('Welcome to your dashboard!')
end

end
