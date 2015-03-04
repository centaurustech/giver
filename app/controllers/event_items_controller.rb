class EventItemsController < ApplicationController
	def create
		@event_item = EventItem.new(event_id: event_items_params[:event_id], item_id: event_items_params[:item_id])
		if @event_item.save
			flash[:success] = "Item successfully added to event"
			redirect_to event_path(event_items_params[:event_id])
		else
			flash[:notice] = "You are limited to one item per event"
			redirect_to board_path(event_items_params[:board])
		end
	end

	private
		def event_items_params
			params.require(:event_item).permit(:event_id, :item_id, :board)
		end
end
