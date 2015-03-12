class EventsController < ApplicationController
	def index
	end

	def show
		@user = User.find(session[:user_id])
		@event = Event.find(params[:id])
		@date = (Date.parse(@event.deadline) - Date.today).to_s
		@date.slice! "/1"
		@comments = Comment.where(event_id: params[:id])
		@comment = Comment.new
		@contributions = Contribution.where(event_id: @event)
		@event_contributions = 0
		@contributions.each do |contribution| 
			@event_contributions = contribution.amount + @event_contributions
		end
	end

	def new
		@user = User.find(session[:user_id])
		@event = Event.new
	end

	def create
		@event = Event.new(event_name: event_params[:event_name], description: event_params[:description], deadline: deadline_params, user_id: session[:user_id])
		if @event.save
			flash[:success] = "Event successfully created"
			redirect_to user_path(session[:user_id])
		else
			flash[:notice] = "Please make sure you fill in all fields and event is after today"
			redirect_to new_event_path
		end
	end

	def destroy
		# in addition to destroying the event, we must also destroy all EventItems
		##related to that event, along with comments, and contributions
		
		#SO 1. Events, 2. EventItems, 3. Contributions, 4. Comments

		# also, there should probably be an JS alert going off when someone presses
		##the delete button, you know, to confirm??
		puts "Event id: \n\n\n\n\n\n"
		puts params
		puts "\n\n\n\n\n\n"
			# destroy the event
		Event.find(params[:id]).destroy
			#destroy the event items
		eventitem = EventItem.where(event_id: params[:id])
		EventItem.find(eventitem[0].id).destroy
			#destroy the contributions
		Contribution.where(event_id: params[:id]).destroy_all
			#destroy the comments
		Comment.where(event_id: params[:id]).destroy_all
		redirect_to user_path(session[:user_id])
		
	end
		

	private
		def event_params
			params.require(:event).permit(:event_name, :description, :day, :month, :year)
		end
		def deadline_params
			require 'date'	
			Date.parse(event_params[:month].to_s + " " + event_params[:day].to_s, ", " + event_params[:year].to_s)
		end
end
