require 'rails_helper'

RSpec.describe Friendship, type: :model do
  it "should require user id" do
	@friendship = Friendship.create(
		user_id: '',
		friend_id: 1
	)
	
  	expect(@friendship).to be_invalid
  end
  it "should require friend id" do
	@friendship = Friendship.create(
		user_id: 1,
		friend_id: ''
	)
	
  	expect(@friendship).to be_invalid
  end

end
