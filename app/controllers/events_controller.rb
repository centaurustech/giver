class EventsController < ApplicationController
	def index
	end

	def show
		@event = Event.find(params[:id])
		@comments = Comment.where(event_id: params[:id])
		@comment = Comment.new
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_name: event_params[:event_name], deadline: deadline_params, user_id: session[:user_id])
		if @event.save
			flash[:success] = "Event successfully created"
			redirect_to user_path(session[:user_id])
		else
			flash[:notice] = "Please make sure you fill in all fields and event is after today"
			redirect_to new_event_path
		end
		
	end

	private
		def event_params
			params.require(:event).permit(:event_name, :day, :month, :year)
		end
		def deadline_params
			Time.new(event_params[:year], event_params[:month], event_params[:day])	
		end
end
