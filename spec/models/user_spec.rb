require 'rails_helper'
#attribute test
#association test
#can do with all model classes
RSpec.describe User, type: :model do
	it "exists" do
		user = User.new
	end
	it {should belong_to(:organization)}
	it "has an email" do
		user = User.new
		expect(user).to respond_to(:email)
	end
end
