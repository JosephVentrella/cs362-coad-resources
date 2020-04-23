require 'rails_helper'

RSpec.describe User, type: :model do

	let(:user){User.new}
	describe "attributes" do
	    it "User has an email" do
			expect(user).to respond_to(:email)
		end
	end

	describe "relationship" do
			it {should belong_to(:organization)} #relationship test
    end
    
   describe "validation" do

    it "validates email" do
	  	expect(user).to validate_presence_of(:email)
	  end

	  it "validates length of password" do
	  	expect(user).to validate_length_of(:password).is_at_least(7).is_at_most(255)
	  end

	  it "validates length of email" do
	  	expect(user).to validate_length_of(:email).is_at_least(1).is_at_most(255)
	  end

	  it { should validate_uniqueness_of(:email).case_insensitive }

  end
  
end