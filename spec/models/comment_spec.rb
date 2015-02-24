require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'should require content' do
  	comment = Comment.create(content: '', user_id: 1, event_id: 2)
  	expect(comment).to be_invalid
  end
  it 'should require user_id' do
  	comment = Comment.create(user_id: '', event_id: 1, content: "hi")
  	expect(comment).to be_invalid
  end
  it 'should require event_id' do
  	comment = Comment.create(event_id: '', user_id: 1, content: 'hi')
  	expect(comment).to be_invalid
  end
end
