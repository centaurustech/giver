class CommentsController < ApplicationController

	def create
		@comment = Comment.new(content: comment_params[:content], user_id: session[:user_id], event_id: comment_params[:event_id])
		if @comment.save
			flash[:success] = "Comment successfully created"
			redirect_to event_path(comment_params[:event_id])
		else
			flash[:notice] = "Try again."
			redirect_to event_path(comment_params[:event_id])
		end
	end

	def destroy
	end

	private
		def comment_params
			params.require(:comment).permit(:content, :event_id)
		end
end
