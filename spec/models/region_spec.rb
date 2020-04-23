require 'rails_helper'

RSpec.describe Region, type: :model do
	it "exists" do
		region = Region.new
	end

	describe 'relationships' do
		it "has many tickets" do
			region = Region.new
			expect(region).to have_many(:tickets)
		end
	end


end