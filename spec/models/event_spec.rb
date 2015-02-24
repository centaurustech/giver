require 'rails_helper'

RSpec.describe Event, type: :model do
  it "should not save if event name is blank" do
  	event = Event.create(
  		event_name: '',
  		deadline: Time.new,
  		user_id: 1
  		)
  	expect(event).to be_invalid
  end
  it "should not save if deadline is blank" do
  	event = Event.create(
  		event_name: "Toby and Stefanie's wedding",
  		deadline: Time.new,
  		user_id: 1
  		)
  	expect(event).to be_invalid
  end
  it "should not save if user_id is blank" do
  	event = Event.create(
  		event_name: "Toby and Stefanie's wedding",
  		deadline: Time.new,
  		user_id: ''
  		)
  	expect(event).to be_invalid
  end
  it "should not save if deadline is less than current time" do
  	now = Time.new
  	false_deadline = Time.new(2015, 01, 01)
  	event = Event.create(
  		event_name: "Toby and Stefanie's wedding",
  		deadline: false_deadline,
  		user_id: 1
  		)
  	# expect(event.deadline).to be >= now
  	## what should we REALLLLLY be expecting on this test????????? ##
  	expect(event).to be_invalid

  end
end
