require 'rails_helper'

RSpec.describe User, type: :model do

	it {should belong_to(:organization)}
	it "User has an email" do
		user = User.new
		expect(user).to respond_to(:email)
	end


   it "validates email" do
    user = User.new
    expect(user).to validate_presence_of(:email)
   end

   it "validates length of password" do
   	user = User.new
   	expect(user).to validate_length_of(:password).is_at_least(7).is_at_most(255)
   end

end