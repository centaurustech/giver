class UsersController < ApplicationController
  def index
  	@user = User.new
  end
  def events
    @events = Event.where(user_id: params[:id])
    @user = User.find(params[:id])
  end
  def show
  	@user = User.find(session[:user_id])
    # show events only from YOUR friends
    @events = Event.all
    users = User.where('id != ?', session[:user_id])
    @friends = User.find(session[:user_id]).friends
    @not_friends = users - @friends
    @friendship = Friendship.new
    @my_events = Event.where(:user_id => @user)
    @events = Event.where(:user_id => @friends)
    @eventitems = EventItem.all
  end
  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:notice] = "User successfully created"
  		redirect_to '/'
  	else

  	end
  end

  def destroy
    sign_out
    redirect_to user
  end

  private
  	def user_params
  		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  	end
end
