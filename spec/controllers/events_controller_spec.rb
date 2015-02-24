require 'rails_helper'
require 'spec_helper'

RSpec.describe EventsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end



end

	##the only real fails i can think of are:
	##if the user doesn't select one/more values
	##if the user picks a date before today
feature 'user creates a new event' do
	# background do
	# 	@user = User.create!(
	# 		:first_name => 'Toby',
	# 		:last_name => 'Redd',
	# 		:email => 'foo@bar.com', 
	# 		:password => 'password',
	# 		:password_confirmation => 'password'
	# 	)
	# end
	scenario 'successfully creates a new event' do
		visit new_event_path
		fill_in 'event_event_name', with: "Spam Jam"
		select '6', :from => 'event_day'
		select '5', :from => 'event_month'
		select '2016', :from => 'event_year'
		click_button "Create Event"
		expect(current_path).to eq(user_path(1))

		##this test ALWAYS is going to the else statement, and is rendering the new page
		##should be redirecting to the user_path
		
	end
end








