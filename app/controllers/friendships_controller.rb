class FriendshipsController < ApplicationController
	def show
		@user = User.find(session[:user_id])
		@events = Event.all
	 	users = User.where('id != ?', session[:user_id])
	 	@friends = User.find(session[:user_id]).friends
	    @not_friends = users - @friends
	    @friendship = Friendship.new
	    @my_events = Event.where(:user_id => @user)
   		@events = Event.where(:user_id => @friends)
	end
	def create
		# Friendship.create(user_id: session[:user_id], friend_id: params[:id])
		# redirect_to user_path(session[:user_id])
		puts "\n\n\n\n\n"
		puts params
		puts "\n\n\n\n\n"
		Friendship.create(friendship_params)
		redirect_to user_path(session[:user_id])

	end

	def destroy
		puts "\n\n\n\n\n"
		puts params
		puts "\n\n\n\n\n"
		@friendship = Friendship.where(user_id: friendship_params[:user_id], friend_id: friendship_params[:friend_id])
		@friendship.destroy_all
		redirect_to user_path(session[:user_id])
	end

	private
		def friendship_params
			params.require(:friendship).permit(:user_id, :friend_id)
		end
end
