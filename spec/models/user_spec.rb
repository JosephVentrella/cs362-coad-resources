require 'rails_helper'
RSpec.describe User, type: :model do

	
let(:user) {User.new}

	describe "attributes" do
	  it "has an email" do
		expect(user).to validate_presence_of(:email)
		end
	end

  #describe "relationship" do
	#specify {expect(user).to belong_to(:organization)} 
 # end
    
  describe "validations" do

    it "validates email" do
	  	expect(user).to validate_presence_of(:email)
	  end

	  it "validates length of password" do
	  	expect(user).to validate_length_of(:password).is_at_least(7).is_at_most(255)
	  end

	  it "validates length of email" do
	  	expect(user).to validate_length_of(:email).is_at_least(1).is_at_most(255)
	  end

	  it "should print email" do
        expected_email = "testtest123@fake.com"
        user = User.new(email: expected_email)
        expect(user.to_s).to eq(expected_email)
	  end
   end
	  it {should validate_uniqueness_of(:email).case_insensitive }

	  describe "set_default_role" do
      user2 = User.new
      user2.set_default_role
	  it "if nil, the default role is organization " do
        expect(user2.role).to eq("organization")
       end
       
	end
end