require 'rails_helper'
require 'spec_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end

feature 'guest users creates an account' do
	scenario 'successfully creates a new user account' do
		visit 'users#index'
		fill_in 'user_first_name', with: "Foo"
		fill_in 'user_last_name', with: "Bar"
		fill_in 'user_email', with: "foobar@yahoo.com"
		fill_in 'user_password', with: 'password'
		fill_in 'user_password_confirmation', with: 'password'
		click_button "Create user"
		expect(page).to have_content "User successfully created"
	end
end

feature 'the signin process' do
	background do
		@user = User.create!(
			:first_name => 'Toby',
			:last_name => 'Redd',
			:email => 'foo@bar.com', 
			:password => 'password',
			:password_confirmation => 'password'
			)
	end
	scenario 'Signing in with correct credentials' do
		visit 'signin'
		fill_in 'Email', :with => 'foo@bar.com'
		fill_in 'Password', :with => 'password'
		click_button 'Login'
		expect(current_path).to eq(user_path(@user))
	end
	given(:other_user) {User.create(:email => 'foo@bar.com', :password => 'password')}
	scenario 'Signing in as another user' do
		visit 'signin'
		fill_in 'Email', :with => 'other_user.email'
		fill_in 'Password', :with => 'other_user.password'
		click_button 'Login'
		expect(page).to have_content 'Invalid email or password'
	end
end
