require 'rails_helper'

RSpec.describe Region, type: :model do
	it "exists" do
		region = Region.new
	end

	describe 'relationships' do
		it { should have_many(:tickets) }
	end

end