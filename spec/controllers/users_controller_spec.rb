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
		fill_in 'users_first_name', with: "Foo"
		fill_in 'users_last_name', with: "Bar"
		fill_in 'users_email', with: "foobar@yahoo.com"
		fill_in 'users_encrypted_password', with: 'password'
		fill_in 'users_salt', with: 'password'
		click_button "Create user"
		expect(page).to have_content "User successfully created"
	end
end
