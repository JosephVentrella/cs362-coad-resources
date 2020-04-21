require 'rails_helper'

RSpec.describe Organization, type: :model do
it "validates email" do
	organization = Organization.new
	expect(organization).to validate_presence_of(:email)
	expect(organization).to validate_presence_of(:name)
	expect(organization).to validate_presence_of(:phone)
	expect(organization).to validate_presence_of(:status)
	expect(organization).to validate_presence_of(:primary_name)
	expect(organization).to validate_presence_of(:secondary_name)
	expect(organization).to validate_presence_of(:secondary_phone)
end 

it "validates length of description" do
	organization = Organization.new
	expect(organization).to validate_length_of(:description).is_at_most(1020)
  
end

end
