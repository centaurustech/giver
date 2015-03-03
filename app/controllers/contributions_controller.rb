class ContributionsController < ApplicationController
	def new
		@contribution = Contribution.new
		@user = session[:user_id]
		@event = params[:id]
	end

	def create
		puts "\n\n\n\n\n"
		puts params
		puts "\n\n\n\n\n"
	end
end
