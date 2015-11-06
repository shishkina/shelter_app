class UsersController < ApplicationController
  skip_before_action :authenticate, only: [:new,:create,:show]

def new
  @user = User.new
end

def index
  @users = User.all
end

def show
  if logged_in?

    @user = User.find(session[:user_id])
  #  if  @user.roles.find{|role| role=='administrator'}
  #   redirect some special admin page
  #   do something fo the admin
  else
    redirect_to login_path
  end
end

def create
  @user = User.new user_params
  if @user.save
    flash[:success] = "Welcome to THE SHELTER"
    redirect_to @user
  else
    render new_user_path
  end
end

def destroy
  @user = User.find params[:id]
  @user.destroy
  redirect_to users_path
end

private

def user_params
  params.require(:user).permit(:name, :phone, :admin, :email, :password, :password_confirmation)
end
end
