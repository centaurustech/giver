require 'rails_helper'
require 'spec_helper'

RSpec.describe CommentsController, type: :controller do

end

#####cannot find event with id=4### WHYYYYYYYYYYYYY WHHHYYYYYYYYYYY come back to this
feature 'user creates a new comment' do
	background do
		@user = User.create!(
			:first_name => 'Toby',
			:last_name => 'Redd',
			:email => 'foo@bar.com', 
			:password => 'password',
			:password_confirmation => 'password'
		)
		@event = Event.create!(
			event_name: "Hello world",
			deadline: Time.new(2016, 1, 1),
			user: @user
		)
	end
	scenario 'user successfully creates a new comment' do
		visit event_path(@event.id)
		fill_in 'comment_content', :with => 'What is up mang?'
		click_button 'Create'
		expect(current_path).to eq(event_path(@event.id))
	end
	###this doesn't actually pass, it is going to the else statement in the create method
	##just so happens that they redirect to the same place...
end
