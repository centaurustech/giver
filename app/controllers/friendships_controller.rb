class FriendshipsController < ApplicationController
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
