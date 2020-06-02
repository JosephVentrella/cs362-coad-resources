require 'rails_helper'

RSpec.describe RegionsController, type: :controller do

	context 'As a non logged-in user' do
	    describe 'GET #index' do
	    	specify { expect(get(:index)).to redirect_to(new_user_session_path)}
	    end

	end
	context 'As a normal user' do
		let(:user){create(:user)}
		before(:each){ sign_in(user) }
		
		describe 'Get #index' do
			specify { expect(get(:index)).to redirect_to(dashboard_path)}
		end
	end 

	context 'As an admin' do
		let(:admin_user){ create(:user, :admin)}
		before(:each) {sign_in(admin_user)}

		describe 'Get #index'do
			specify {expect(get(:index)).to be_successful}
		end
	end
end
