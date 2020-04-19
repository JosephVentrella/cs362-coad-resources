require 'rails_helper'

RSpec.describe Organization, type: :model do
	it "exists" do
		organization = Organization.new
	end
	it "has many users" do
		user = User.new
		expect(user).to respond_to(:email)
	end

end
