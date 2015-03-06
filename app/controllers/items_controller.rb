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
	end

	private
		def item_params
			params.require(:item).permit(:board_id, :item_name, :total_price, :photo)
		end
end
