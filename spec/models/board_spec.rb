require 'rails_helper'

RSpec.describe Board, type: :model do
  it 'should require board name' do
  	@board = Board.new(
  		board_name: '',
  		user_id: 1
  	)
  	expect(@board).to be_invalid
  end


end
