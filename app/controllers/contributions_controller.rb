class ContributionsController < ApplicationController
	def show
		@user = User.find(session[:user_id])
		@contributions = Contribution.where(user_id: session[:user_id])
	end
	def new
		@contribution = Contribution.new
		@user = session[:user_id]
		@event = params[:id]
		@item = params[:item_id]
	end

	def create
		puts "\n\n\n\n\n"
		puts params
		puts "\n\n\n\n\n"

		@contribution = Contribution.new(contribution_params)
		if @contribution.save
			flash[:success] = "Thank you for your contribution!"
			redirect_to event_path(contribution_params[:event_id])
		else
			flash[:notice] = "Please try again"
			redirect_to event_path(contribution_params[:event_id])
		end

	end

	private
		def contribution_params
			params.require(:contribution).permit(:amount, :user_id, :event_id)
		end
end
