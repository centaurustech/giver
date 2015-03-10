class ItemsController < ApplicationController
	def index
	end

	def show
	end

	def new
	end

	def create
		@item = Item.new(item_params)
		# @item.photo = params[:photo]
		if @item.save
			flash[:success] = 'Item successfully created'
			redirect_to board_path(item_params[:board_id])
		else
			flash[:notice] = 'Please fill in all fields'
			redirect_to board_path(item_params[:board_id])
		end
	end

	def edit
	end

	def update
	end

	def destroy
		# user should also receive JS alert for them to confirm if they ACTUALLY want 
		##to destroy the item, and that all contributions associated with the ITEM
		##will also be destroyed
		#destroy item
		item = Item.find(params[:id])
		@board = item.board_id
		item.destroy
		#destroy eventItem
		eventitem = EventItem.where(item_id: params[:id])
		if !eventitem.nil?
			EventItem.find(eventitem[0].id).destroy
		end
		#destroy related contributions
		contribution = Contribution.where(event_id: eventitem[0].event_id)
		if !contribution.nil?
			contribution.destroy_all
		end
		redirect_to board_path(@board)
	end

	private
		def item_params
			params.require(:item).permit(:board_id, :item_name, :total_price, :photo)
		end
end
