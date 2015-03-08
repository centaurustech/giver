class BoardsController < ApplicationController
	def index
		@boards = Board.where(user_id: session[:user_id])
		@user = User.find(session[:user_id])
	end

	def user
		@boards = Board.where(user_id: params[:id])
		@user = User.find(params[:id])
	end

	def show
		@board = Board.find(params[:id])
		@items = Item.where(board_id: @board.id)
		@item = Item.new
		@events = Event.where(user_id: session[:user_id])
		@items = Item.where(board_id: params[:id])
		@event_item = EventItem.new
	end

	def new
		@board = Board.new
		@user = User.find(session[:user_id])
	end

	def create
		@board = Board.create(board_name: board_params[:board_name], user_id: session[:user_id])
		if @board.save
			flash[:success] = "Board created"
			# redirect_to user_path(session[:user_id])
			redirect_to boards_path
		else
			flash[:notice] = "Try again"
			redirect_to new_board_path
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
		def board_params
			params.require(:board).permit(:board_name)
		end
end
