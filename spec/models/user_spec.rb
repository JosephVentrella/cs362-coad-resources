require 'rails_helper'

RSpec.describe User, type: :model do
	it {should belong_to(:organization)}
	it "has email" do
		user = User.new
		expect(user).to respond_to(:email)
	end
end