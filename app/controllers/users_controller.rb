class UsersController < ApplicationController
  def index
  	@user = User.new
  end
  def events
    @events = Event.where(user_id: session[:user_id])
    @user = User.find(session[:user_id])
  end
  def show
  	@user = User.find(session[:user_id])
    @events = Event.all
    users = User.where('id != ?', session[:user_id])
    @friends = User.find(session[:user_id]).friends
    @not_friends = users - @friends
  end
  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:notice] = "User successfully created"
  		redirect_to '/'
  	else

  	end
  end

  private
  	def user_params
  		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  	end
end
